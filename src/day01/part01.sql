WITH elf_ided AS (
  SELECT
      SUM((calories IS NULL)::INT) OVER (ORDER BY id) + 1 elf
    , calories
  FROM day01_calorie_counting
)

SELECT
    SUM(calories) sum_calories
FROM elf_ided
GROUP BY elf
ORDER BY 1 DESC
FETCH FIRST 1 ROWS WITH TIES;
