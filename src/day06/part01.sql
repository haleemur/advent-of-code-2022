WITH repeats AS (
    SELECT
        datum
      , rn
      , STRING(datum, '') OVER w preceding_3
    FROM day06_packet_sequence
       , REGEXP_SPLIT_TO_TABLE(datastream, '') WITH ordinality AS d(datum, rn)
    WINDOW w AS (ORDER BY rn ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING)
)

SELECT
    datum
  , rn
  , preceding_3
  , COUNT(DISTINCT p3)
FROM repeats
   , REGEXP_SPLIT_TO_TABLE(preceding_3, '') p3
WHERE preceding_3 !~ datum
GROUP BY 1, 2, 3
HAVING COUNT(DISTINCT p3) = 3
ORDER BY rn
LIMIT 1
