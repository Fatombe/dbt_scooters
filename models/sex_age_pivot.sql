select
    age,
    {{dbt_utils.default__pivot("sex", ["M", "F"])}}
from
    {{ ref("trips_users") }}
group by
    1
order by
    1