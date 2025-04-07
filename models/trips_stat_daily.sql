SELECT date(started_at) AS date,
count(*) AS trips,
max(price) / 100 AS max_price_rub,
avg(distance) / 1000 AS avg_distance_km 
FROM scooters_raw.trips t 
GROUP BY 1 
ORDER BY 1