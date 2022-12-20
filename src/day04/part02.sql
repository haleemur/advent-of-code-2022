WITH ranges AS (
  SELECT
      id
      , ('[' || REPLACE(section1, '-', ',') || ']')::int4range section1
      , ('[' || REPLACE(section2, '-', ',') || ']')::int4range section2
  FROM day04_assignments
)

SELECT
    COUNT(*)
FROM ranges
WHERE section1 && section2
