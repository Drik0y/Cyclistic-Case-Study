-- 1. Total number of trips per type of bike 
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis1` AS
SELECT
  rideable_type,
  member_casual,
  COUNT(ride_id) AS num_trips
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
GROUP BY
  member_casual,
  rideable_type;

-- 2. Visualization2: Total number of trips per month
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis2` AS
SELECT
  month,
  member_casual,
  COUNT(ride_id) AS num_trips
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
GROUP BY
  month,
  member_casual
ORDER BY
  member_casual,
  (CASE
  WHEN month = 'JAN' THEN 1
  WHEN month = 'FEB' THEN 2
  WHEN month = 'MAR' THEN 3
  WHEN month = 'APR' THEN 4
  WHEN month = 'MAY' THEN 5
  WHEN month = 'JUN' THEN 6
  WHEN month = 'JUL' THEN 7
  WHEN month = 'AUG' THEN 8
  WHEN month = 'SEP' THEN 9
  WHEN month = 'OCT' THEN 10
  WHEN month = 'NOV' THEN 11
  WHEN month = 'DEC' THEN 12
  ELSE 0 END);

-- 3. Total number of trips per day of the week
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis3` AS
SELECT  
  day_of_week,
  member_casual,
  COUNT(ride_id) AS num_trips
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
GROUP BY
  day_of_week,
  member_casual
ORDER BY
  member_casual,
  (CASE
  WHEN day_of_week = 'MON' THEN 1
  WHEN day_of_week = 'TUES' THEN 2
  WHEN day_of_week = 'WED' THEN 3
  WHEN day_of_week = 'THURS' THEN 4
  WHEN day_of_week = 'FRI' THEN 5
  WHEN day_of_week = 'SAT' THEN 6
  WHEN day_of_week = 'SUN' THEN 7
  ELSE 8
  END);

-- 4. Total number of trips per hour of the day
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis4` AS
SELECT  
  EXTRACT(HOUR FROM(started_at)) AS hour,
  member_casual,
  COUNT(ride_id) AS num_trips
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
GROUP BY
  hour,
  member_casual
ORDER BY
  member_casual,
  hour;

-- 5. Average trip duration per month
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis5` AS
SELECT
  month,
  member_casual,
  AVG(ride_duration) AS avg_duration
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
GROUP BY
  month,
  member_casual
ORDER BY
  member_casual,
  (CASE
  WHEN month = 'JAN' THEN 1
  WHEN month = 'FEB' THEN 2
  WHEN month = 'MAR' THEN 3
  WHEN month = 'APR' THEN 4
  WHEN month = 'MAY' THEN 5
  WHEN month = 'JUN' THEN 6
  WHEN month = 'JUL' THEN 7
  WHEN month = 'AUG' THEN 8
  WHEN month = 'SEP' THEN 9
  WHEN month = 'OCT' THEN 10
  WHEN month = 'NOV' THEN 11
  WHEN month = 'DEC' THEN 12
  ELSE 0 END);

-- 6. Average trip duration per day of the week
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis6` AS
SELECT  
  day_of_week,
  member_casual,
  AVG(ride_duration) AS avg_duration
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
GROUP BY
  day_of_week,
  member_casual
ORDER BY
  member_casual,
  (CASE
  WHEN day_of_week = 'MON' THEN 1
  WHEN day_of_week = 'TUES' THEN 2
  WHEN day_of_week = 'WED' THEN 3
  WHEN day_of_week = 'THURS' THEN 4
  WHEN day_of_week = 'FRI' THEN 5
  WHEN day_of_week = 'SAT' THEN 6
  WHEN day_of_week = 'SUN' THEN 7
  ELSE 8
  END);
-- 7. Average trip duration per hour of the day
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis7` AS
SELECT  
  EXTRACT(HOUR FROM(started_at)) AS hour,
  member_casual,
  AVG(ride_duration) AS avg_duration
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
GROUP BY
  hour,
  member_casual
ORDER BY
  member_casual,
  hour;

-- 8. Top 10 start stations for member users
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis8` AS
SELECT  
  DISTINCT start_station_name AS start_station,
  AVG(start_lat) AS latitude,
  AVG(start_lng) AS longitude,
  COUNT(ride_id) AS num_trips,
  member_casual
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
WHERE
  member_casual = "member"
GROUP BY
  start_station,
  member_casual
ORDER BY
  num_trips DESC
LIMIT 10;

-- 9. Top 10 start stations for casual users
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis9` AS
SELECT  
  DISTINCT start_station_name AS start_station,
  AVG(start_lat) AS latitude,
  AVG(start_lng) AS longitude,
  COUNT(ride_id) AS num_trips,
  member_casual
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
WHERE
  member_casual = "casual"
GROUP BY
  start_station,
  member_casual
ORDER BY
  num_trips DESC
LIMIT 10;

-- 10. Top 10 End Stations for member users
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis10` AS
SELECT  
  DISTINCT end_station_name AS end_station,
  AVG(end_lat) AS latitude,
  AVG(end_lng) AS longitude,
  COUNT(ride_id) AS num_trips,
  member_casual
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
WHERE
  member_casual = "member"
GROUP BY
  end_station,
  member_casual
ORDER BY
  num_trips DESC
LIMIT 10;

-- 11. Top 10 End Stations for casual users
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.vis11` AS
SELECT  
  DISTINCT end_station_name AS end_station,
  AVG(end_lat) AS latitude,
  AVG(end_lng) AS longitude,
  COUNT(ride_id) AS num_trips,
  member_casual
FROM `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data`
WHERE
  member_casual = "casual"
GROUP BY
  end_station,
  member_casual
ORDER BY
  num_trips DESC
LIMIT 10;

