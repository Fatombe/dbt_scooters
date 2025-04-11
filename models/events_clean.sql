select distinct *
from {{ source('scooters_raw', 'events') }}
{% if is_incremental() %}
  where "timestamp" > (select max("timestamp") from {{ this }})
{% else %}
  where "timestamp" < date '2023-08-01'
{% endif %}