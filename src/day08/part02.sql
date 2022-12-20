WITH reshaped AS (
  SELECT
      id col_id
    , row_id
    , height
  FROM day08_trees
  JOIN LATERAL UNNEST(REGEXP_SPLIT_TO_ARRAY(treerow, '')) WITH ORDINALITY treerow (height, row_id)
    ON TRUE
)

SELECT MAX(row_.l * row_.r * col_.u * col_.d) score
FROM reshaped tree
JOIN LATERAL (
  SELECT
      tree.row_id
    , tree.col_id
    , tree.row_id - COALESCE(MAX(x.row_id) FILTER (WHERE x.row_id < tree.row_id), 1) l
    , COALESCE(MIN(x.row_id) FILTER (WHERE x.row_id > tree.row_id), 99) - tree.row_id r
  FROM reshaped x
  WHERE tree.col_id = x.col_id
    AND tree.height <= x.height
  GROUP BY 1
  ) row_
  ON tree.row_id = row_.row_id AND tree.col_id = row_.col_id
JOIN LATERAL (
  SELECT
      tree.row_id
    , tree.col_id
    , tree.col_id - COALESCE(MAX(x.col_id) FILTER (WHERE x.col_id < tree.col_id), 1) u
    , COALESCE(MIN(x.col_id) FILTER (WHERE x.col_id > tree.col_id), 99) - tree.col_id d
  FROM reshaped x
  WHERE tree.row_id = x.row_id
    AND tree.height <= x.height
  GROUP BY 1
  ) col_
  ON tree.row_id = col_.row_id
 AND tree.col_id = col_.col_id
