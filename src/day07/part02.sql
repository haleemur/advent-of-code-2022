with recursive parse_output AS (
select
  nav
, substring(shell_output, '^\d+')::bigint size
, sum(nav is not null::int) over (order by id) cd_seq
from day07_filesystem,
lateral (select CASE WHEN shell_output LIKE '$ cd %' THEN regexp_replace(shell_output, '\$ cd ', '') END nav) nav
)
, walk as (
select distinct
  cd_seq
, first_value(nav) over (partition by cd_seq) nav
, sum(coalesce(size, 0)) over (partition by cd_seq) dir_size
FROM parse_output
order by cd_seq
)
, rec AS (
    select
        *
      , array[]::text[] path
    from walk
    WHERE nav = '/'
    UNION ALL
    select
        walk.*
      , case when walk.nav != '..' then rec.path || walk.nav else rec.path[:cardinality(rec.path) - 1] end path
    from rec
    join walk
      on walk.cd_seq = rec.cd_seq + 1
)
, paths as (
select
  p.cd_seq
, p.nav
, '/' || array_to_string(p.path, '/') path
, p.dir_size
from rec p
)
, distinct_paths as (
    select path, min(cd_seq) cd_seq, max(dir_size) dir_size
    from paths
    group by 1
)
, unused_space as (
select p.path
, sum(c.dir_size) recursive_total_size
, 70000000 - max(sum(c.dir_size)) over () + sum(c.dir_size) unused_space
from distinct_paths c
join distinct_paths p on c.path like p.path || '%'
group by p.path
)
select *
from unused_space
where unused_space > 30000000
order by unused_space
limit 1
