WITH RECURSIVE moves AS (
  SELECT
      move_direction
    , ROW_NUMBER() OVER (ORDER BY id) move_id
  FROM day09_moves
  CROSS JOIN generate_series(1, move_units) x
)

, rec AS (
  SELECT
    0::bigint move_id
  , 's'::char move_direction
  , array[0, 0]::int[] x0
  , array[0, 0]::int[] x1
  , array[0, 0]::int[] x2
  , array[0, 0]::int[] x3
  , array[0, 0]::int[] x4
  , array[0, 0]::int[] x5
  , array[0, 0]::int[] x6
  , array[0, 0]::int[] x7
  , array[0, 0]::int[] x8
  , array[0, 0]::int[] x9

  UNION ALL

  SELECT
      moves.move_id
    , moves.move_direction
    , m0.x0
    , m1.x1
    , m2.x2
    , m3.x3
    , m4.x4
    , m5.x5
    , m6.x6
    , m7.x7
    , m8.x8
    , m9.x9

  FROM rec
  JOIN moves
    ON rec.move_id + 1 = moves.move_id

  JOIN LATERAL (
    SELECT
      CASE moves.move_direction
        WHEN 'L' THEN array[rec.x0[1] - 1, rec.x0[2]]
        WHEN 'R' THEN array[rec.x0[1] + 1, rec.x0[2]]
        WHEN 'D' THEN array[rec.x0[1], rec.x0[2] - 1]
        WHEN 'U' THEN array[rec.x0[1], rec.x0[2] + 1]
      END x0
  ) m0 ON TRUE
  JOIN LATERAL (SELECT move_following(m0.x0, rec.x1) x1) m1 ON TRUE
  JOIN LATERAL (SELECT move_following(m1.x1, rec.x2) x2) m2 ON TRUE
  JOIN LATERAL (SELECT move_following(m2.x2, rec.x3) x3) m3 ON TRUE
  JOIN LATERAL (SELECT move_following(m3.x3, rec.x4) x4) m4 ON TRUE
  JOIN LATERAL (SELECT move_following(m4.x4, rec.x5) x5) m5 ON TRUE
  JOIN LATERAL (SELECT move_following(m5.x5, rec.x6) x6) m6 ON TRUE
  JOIN LATERAL (SELECT move_following(m6.x6, rec.x7) x7) m7 ON TRUE
  JOIN LATERAL (SELECT move_following(m7.x7, rec.x8) x8) m8 ON TRUE
  JOIN LATERAL (SELECT move_following(m8.x8, rec.x9) x9) m9 ON TRUE

)
SELECT COUNT(DISTINCT x9)
FROM rec
