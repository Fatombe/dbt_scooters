with weekly_stat_cte as (
    select
        user_id,
        date_trunc('week', "date") as "week",
        count(distinct date("date")) as days_per_week
    from
        {{ ref('trips_prep') }}
    group by
        1,
        2
)

select
    user_id,
    avg(days_per_week) >= 6 as fan,
    avg(days_per_week) >= 3 as regular
from weekly_stat_cte
group by 1
    