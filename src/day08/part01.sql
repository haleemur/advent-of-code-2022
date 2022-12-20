WITH reshaped AS (
  SELECT
      id col_id
    , row_id
    , height
  FROM day08_trees
  JOIN LATERAL UNNEST(REGEXP_SPLIT_TO_ARRAY(treerow, '')) WITH ORDINALITY treerow (height, row_id)
    ON TRUE
)
SELECT
    (SELECT MAX(col_id) * MAX(row_id) FROM reshaped) - COUNT(*)
FROM reshaped tree
WHERE EXISTS (
    SELECT 1
    FROM reshaped left_
    WHERE tree.col_id = left_.col_id
      AND tree.row_id > left_.row_id
      AND tree.height <= left_.height
    )
  AND EXISTS (
    SELECT 1
    FROM reshaped right_
    WHERE tree.col_id = right_.col_id
      AND tree.row_id < right_.row_id
      AND tree.height <= right_.height
    )
  AND EXISTS (
    SELECT 1
    FROM reshaped up_
    WHERE tree.row_id = up_.row_id
      AND tree.col_id > up_.col_id
      AND tree.height <= up_.height
    )
  AND EXISTS (
    SELECT 1
    FROM reshaped down_
    WHERE tree.row_id = down_.row_id
      AND tree.col_id < down_.col_id
      AND tree.height <= down_.height
    )

