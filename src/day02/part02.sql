WITH new_rule AS (
SELECT
  opponent_move
, my_score
, CHR((ROW_NUMBER() OVER (PARTITION BY opponent_move ORDER BY my_score)::INT + ASCII('X') - 1) result
FROM day02_scoring_rule
)
SELECT
SUM(my_score)
FROM day02_rock_paper_scissors rps(id, opponent_move, result)
NATURAL JOIN new_rule
