with
    date_age_cte as (

        select
            date(t.started_at) as date,
            extract(year from t.started_at) - extract(year from u.birth_date) as age
        from trips t
        join users u on t.user_id = u.id

    ),

    count_cte as (
        select date, age, count(*) as trips from date_age_cte group by 1, 2 order by 1
    )

select age as age, avg(trips)
from count_cte
group by 1
order by 1
