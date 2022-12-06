with repeats AS (
select datum
, rn
, string_agg(datum, '') over w preceding_3
from day06_packet_sequence
, regexp_split_to_table(datastream, '') with ordinality as d(datum, rn)
window w as (order by rn rows between 3 preceding and 1 preceding)
)
select datum, rn, preceding_3, count(distinct p3)
from repeats
, regexp_split_to_table(preceding_3, '') p3
where preceding_3 !~ datum
group by 1, 2, 3
having count(distinct p3) = 3
order by rn
limit 1
