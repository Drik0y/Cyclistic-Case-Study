-- Checking for null values
SELECT  
  COUNT(*)-COUNT(ride_id) AS ride_id,
  COUNT(*)-COUNT(rideable_type) AS rideable_type,
  COUNT(*)-COUNT(started_at) AS started_at,
  COUNT(*)-COUNT(ended_at) AS ended_at,
  COUNT(*)-COUNT(start_station_name) AS start_station_name,
  COUNT(*)-COUNT(start_station_id) AS start_station_id,
  COUNT(*)-COUNT(end_station_name) AS end_station_name,
  COUNT(*)-COUNT(end_station_id) AS end_station_id,
  COUNT(*)-COUNT(start_lat) AS start_lat,
  COUNT(*)-COUNT(start_lng) AS start_lng,
  COUNT(*)-COUNT(end_lat) AS end_lat,
  COUNT(*)-COUNT(end_lng) AS end_lng
FROM `coursera-training-420312.cyclistic_bikeshare.combined_data`;

-- Checking for Inconsistent Data Types
SELECT *
FROM 
  `coursera-training-420312.cyclistic_bikeshare.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS`
WHERE
  table_name = "combined_data";

-- Checking for Inconsistencies in Primary Key
SELECT
  LENGTH(ride_id) AS ride_id_len
FROM
  `coursera-training-420312.cyclistic_bikeshare.combined_data`
GROUP BY
  ride_id_len;

-- Checking for Duplicate Primary Key
SELECT
  COUNT(*) AS num_of_rows,
  COUNT(DISTINCT ride_id) AS num_of_distinct_ride_id
FROM `coursera-training-420312.cyclistic_bikeshare.combined_data`;

-- Checking for Invalid / Mispelled Bike Type Values
SELECT
  DISTINCT rideable_type AS bike_type,
FROM
  `coursera-training-420312.cyclistic_bikeshare.combined_data`;

-- Checking for Invalid / Mispelled Type of Users
SELECT
  DISTINCT member_casual AS user_type,
FROM
  `coursera-training-420312.cyclistic_bikeshare.combined_data`;

-- Looking for Outliers in the Trip Duration
-- Trip Durations that are less than a minute
SELECT
  COUNT(*) AS trips_less_than_min
FROM
  `coursera-training-420312.cyclistic_bikeshare.combined_data`
WHERE
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60 <= 1;

-- Trip Durations that are longer than a day
SELECT
  COUNT(*) AS trips_longer_than_day
FROM
  `coursera-training-420312.cyclistic_bikeshare.combined_data`
WHERE
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60 >= 1140;