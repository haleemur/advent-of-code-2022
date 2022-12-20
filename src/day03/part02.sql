WITH items AS (
  SELECT DISTINCT
      id
    , (id-1) / 3 grp_id
    , regexp_split_to_table(contents, '') item
  FROM day03_rucksack_contents
)

SELECT
    SUM(
      CASE
        WHEN i1.item = LOWER(i1.item) THEN ASCII(i1.item) - ASCII('a') + 1
        ELSE ASCII(i1.item) - ASCII('A') + 27
      END
    )
FROM items i1
JOIN items i2
  ON i2.id = i1.id + 1
 AND i2.grp_id = i1.grp_id
 AND i2.item = i1.item
JOIN items i3
  ON i3.id = i2.id + 1
 AND i3.grp_id = i2.grp_id
 AND i3.item = i2.item
