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
    SUM(pts * x_started)
FROM rec
JOIN UNNEST(ARRAY[20, 60, 100, 140, 180, 220]) pts
  ON pts BETWEEN cycle_started AND cycle_ended
