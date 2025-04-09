select
    id,
    user_id,
    scooter_hw_id,
    started_at,
    finished_at,
    start_lat,
    start_lon,
    finish_lat,
    finish_lon,
    distance as distance_m,
    CAST(price AS decimal(20, 2)) / 100 as price_rub,
    extract(epoch from (finished_at - started_at)) AS duration_s,
    finished_at <> started_at and price = 0 as is_free,
    date(started_at) as date
from {{ source("scooters_raw", "trips") }}
