WITH priorities AS (
SELECT
    contents
  , common_item
  , CASE WHEN common_item = LOWER(common_item)
    THEN ascii(common_item) - ascii('a') + 1
    ELSE ascii(common_item) - ascii('A') + 27
    END priority
FROM day03_rucksack_contents
, LATERAL (SELECT LENGTH(contents) / 2 l) l
, LATERAL (SELECT '[' || SUBSTRING(contents FROM 1 FOR l) || ']' sub1) sub1
, LATERAL (SELECT SUBSTRING(contents FROM l+1 FOR l) sub2) sub2
, LATERAL (SELECT SUBSTRING(sub2 FROM sub1) common_item) common_item
)
SELECT SUM(priority) sum_priority
FROM priorities
