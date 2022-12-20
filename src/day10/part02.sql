WITH RECURSIVE parsed AS (
  SELECT
      CASE WHEN op = 'addx' THEN split_part(cmd, ' ', 2)::int ELSE 0 END val
    , CASE WHEN op = 'addx' THEN 2 ELSE 1 END inc
    , id
  FROM day10_crt
  JOIN LATERAL split_part(cmd, ' ', 1) op ON TRUE
)

, rec AS (
  SELECT
      0 id
    , 1 x_started
    , 1 x_ended
    , 0 cycle_started
    , 0 cycle_ended

  UNION ALL

  SELECT
      parsed.id
    , rec.x_ended x_started
    , rec.x_ended + parsed.val x_ended
    , rec.cycle_ended + 1 cycle_started
    , rec.cycle_ended + parsed.inc cycle_ended
  FROM rec
  JOIN parsed
    ON parsed.id = rec.id + 1
)

SELECT
    ARRAY_TO_STRING(ARRAY_AGG(px ORDER BY pos), '')
FROM rec
JOIN LATERAL GENERATE_SERIES(cycle_started - 1, cycle_ended - 1, 1) pos ON TRUE
JOIN LATERAL (SELECT pos / 40 rn) rn ON TRUE
JOIN LATERAL (
  SELECT
      CASE
        WHEN pos - (rn * 40) BETWEEN x_started - 1 AND x_started + 1 THEN '#'
        ELSE '.'
      END px
) px
  ON TRUE
WHERE rec.cycle_ended > 0
GROUP BY rn
