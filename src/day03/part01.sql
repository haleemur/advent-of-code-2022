WITH priorities AS (
  SELECT
      contents
    , common_item
    , CASE
        WHEN common_item = LOWER(common_item) THEN ASCII(common_item) - ASCII('a') + 1
        ELSE ASCII(common_item) - ASCII('A') + 27
      END priority
  FROM day03_rucksack_contents
  JOIN LATERAL (SELECT LENGTH(contents) / 2 l) l ON TRUE
  JOIN LATERAL (SELECT '[' || SUBSTRING(contents FROM 1 FOR l) || ']' sub1) sub1 ON TRUE
  JOIN LATERAL (SELECT SUBSTRING(contents FROM l+1 FOR l) sub2) sub2 ON TRUE
  JOIN LATERAL (SELECT SUBSTRING(sub2 FROM sub1) common_item) common_item ON TRUE
)
SELECT
    SUM(priority) sum_priority
FROM priorities
