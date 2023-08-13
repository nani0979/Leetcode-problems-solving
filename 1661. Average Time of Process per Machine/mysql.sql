# Write your MySQL query statement below

with CTE as (
    select 
        A1.machine_id, 
        A1.process_id, 
        (A2.timestamp - A1.timestamp) as process_time 
    from 
        Activity A1, Activity A2
    where 
        A1.machine_id = A2.machine_id and
        A1.process_id = A2.process_id and
        A1.activity_type = 'start' and
        A2.activity_type = 'end'
)

select 
    machine_id,
    round(sum(process_time)/count(process_time),3) as processing_time
from 
    CTE
group by machine_id
