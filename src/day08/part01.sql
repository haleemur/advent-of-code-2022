with reshaped as (
select id col_id, row_id, height
from day08_trees
, unnest(regexp_split_to_array(treerow, '')) with ordinality as treerow (height, row_id)
)
select
(select max(col_id) * max(row_id) from reshaped) - count(*)
from reshaped tree
where exists (
    select 1
    from reshaped left_
    where tree.col_id = left_.col_id
      and tree.row_id > left_.row_id
      and tree.height <= left_.height
    )
  and exists (
    select 1
    from reshaped right_
    where tree.col_id = right_.col_id
      and tree.row_id < right_.row_id
      and tree.height <= right_.height
    )
  and exists (
    select 1
    from reshaped up_
    where tree.row_id = up_.row_id
      and tree.col_id > up_.col_id
      and tree.height <= up_.height
    )
  and exists (
    select 1
    from reshaped down_
    where tree.row_id = down_.row_id
      and tree.col_id < down_.col_id
      and tree.height <= down_.height
    )

