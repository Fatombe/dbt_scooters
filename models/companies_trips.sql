with
    trips_cte as (
        select c.company, count(*) as trips
        from {{ ref("trips_prep") }} as tp
        join {{ ref("scooters") }} as c on tp.scooter_hw_id = c.hardware_id
        group by 1
    )
select
    company,
    t.trips,
    c.scooters,
    t.trips / cast(c.scooters as float) as trips_per_scooter
from trips_cte t
join {{ ref("companies") }} as c using (company)
