with monthly_stat_cte as (
    select
        user_id,
        date_trunc('month', "date") as "month",
        count(*) as trips_per_month
    from
        {{ ref('trips_prep') }}
    group by
        1,
        2
)
select
    user_id,
    sum(trips_per_month) <= 2 as rare
from monthly_stat_cte
group by
    1