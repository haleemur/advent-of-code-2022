WITH RECURSIVE parse_output AS (
  SELECT
      nav
    , SUBSTRING(shell_output, '^\d+')::bigint size
    , SUM(nav IS not null::int) OVER (ORDER BY id) cd_seq
  FROM day07_filesystem
  JOIN LATERAL (
      SELECT
        CASE
          WHEN shell_output LIKE '$ cd %' THEN regexp_replace(shell_output, '\$ cd ', '')
        END nav
    ) nav ON TRUE
)

, walk AS (
  SELECT DISTINCT
    cd_seq
  , FIRST_VALUE(nav) OVER (PARTITION BY cd_seq) nav
  , SUM(COALESCE(size, 0)) OVER (PARTITION BY cd_seq) dir_size
  FROM parse_output
  ORDER BY cd_seq
)
, rec AS (
  SELECT
      *
    , array[]::text[] path
  FROM walk
  WHERE nav = '/'

  UNION ALL

  SELECT
      walk.*
    , CASE
        WHEN walk.nav != '..' THEN rec.path || walk.nav
        ELSE rec.path[:cardinality(rec.path) - 1]
      END path
  FROM rec
  JOIN walk
    ON walk.cd_seq = rec.cd_seq + 1
)

, paths AS (
  SELECT
      p.cd_seq
    , p.nav
    , '/' || array_to_string(p.path, '/') path
    , p.dir_size
  FROM rec p
)

, distinct_paths AS (
  SELECT
      path
    , MAX(dir_size) dir_size
  FROM paths
  GROUP BY 1
)

SELECT DISTINCT
    SUM(SUM(c.dir_size)) OVER ()
FROM distinct_paths c
JOIN distinct_paths p
  ON c.path LIKE p.path || '%'
GROUP BY p.path
HAVING SUM(c.dir_size) < 100000
