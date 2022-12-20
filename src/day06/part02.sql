WITH repeats AS (
  SELECT
      datum
    , rn
    , STRING_AGG(datum, '') OVER w preceding_3
  FROM day06_packet_sequence
     , regexp_split_to_table(datastream, '') WITH ordinality AS d(datum, rn)
  WINDOW w AS (ORDER BY rn ROWS BETWEEN 13 PRECEDING AND 1 PRECEDING)
)

SELECT
    datum
  , rn
  , preceding_3
  , COUNT(DISTINCT p3
FROM repeats
   , regexp_split_to_table(preceding_3, '') p3
WHERE preceding_3 !~ datum
GROUP BY 1, 2, 3
HAVING COUNT(DISTINCT p3 = 13
ORDER BY rn
LIMIT 1
