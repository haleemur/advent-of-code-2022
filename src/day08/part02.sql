with reshaped as (
select id col_id, row_id, height
from day08_trees
, unnest(regexp_split_to_array(treerow, '')) with ordinality as treerow (height, row_id)
)
select max(l * r * u * d) score
from reshaped tree
join lateral (
    select
      tree.row_id
    , tree.col_id
    , tree.row_id - coalesce(max(row_id) filter (where x.row_id < tree.row_id),  1) l
    , coalesce(min(row_id) filter (where x.row_id > tree.row_id), 99) - tree.row_id r
    from reshaped x
    where tree.col_id = x.col_id
      and tree.height <= x.height
    group by 1
    ) row_ on tree.row_id = row_.row_id and tree.col_id = row_.col_id
join lateral (
    select
      tree.row_id
    , tree.col_id
    , tree.col_id - coalesce(max(col_id) filter (where x.col_id < tree.col_id),  1) u
    , coalesce(min(col_id) filter (where x.col_id > tree.col_id), 99) - tree.col_id d
    from reshaped x
    where tree.row_id = x.row_id
      and tree.height <= x.height
    group by 1
    ) col_ on tree.row_id = col_.row_id and tree.col_id = col_.col_id
