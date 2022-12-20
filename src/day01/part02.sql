WITH elf_ided AS (
  SELECT
      SUM((calories IS NULL)::INT) OVER (ORDER BY id) + 1 elf
    , calories
  FROM day01_calorie_counting
)

, top_3 AS (
  SELECT
      elf
    , SUM(calories) sum_calories
  FROM elf_ided
  GROUP BY 1
  ORDER BY 2 DESC
  FETCH FIRST 3 ROWS WITH TIES
)

SELECT SUM(sum_calories)
FROM top_3
