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
  , array[0, 0]::int[] h
  , array[0, 0]::int[] t

  UNION ALL

  SELECT
      moves.move_id
    , moves.move_direction
    , lat1.h
    , move_following(lat1.h, rec.t) t
  FROM rec
  JOIN moves
    ON rec.move_id + 1 = moves.move_id
  JOIN LATERAL (
    SELECT
      CASE moves.move_direction
        WHEN 'L' THEN array[rec.h[1] - 1, rec.h[2]]
        WHEN 'R' THEN array[rec.h[1] + 1, rec.h[2]]
        WHEN 'D' THEN array[rec.h[1], rec.h[2] - 1]
        WHEN 'U' THEN array[rec.h[1], rec.h[2] + 1]
      END h
    ) lat1 ON TRUE
)
SELECT COUNT(DISTINCT t)
FROM rec
