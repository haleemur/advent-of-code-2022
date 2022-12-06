with ranges as (
select
  id
, ('[' || replace(section1, '-', ',') || ']')::int4range section1
, ('[' || replace(section2, '-', ',') || ']')::int4range section2
from day04_assignments
-- where id = 72
)
select
count(*)
from ranges
where section1 @> section2 or section2 @> section1
