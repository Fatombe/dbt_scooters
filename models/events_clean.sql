{% set date = var("date", none) %}

select distinct *,
  {{ updated_at() }}
from {{ source('scooters_raw', 'events') }}
{% if is_incremental() %}
  {% if date %}
  where date("timestamp") = date '{{ date }}'
  {% else %}  
  where "timestamp" > (select max("timestamp") from {{ this }})
  {% endif %}
{% else %}
  where "timestamp" < date '2023-08-01'
{% endif %}