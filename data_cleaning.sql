-- Data Cleaning: Creating new table that removes rows affects data integrity.
-- New columns will be added: ride_duration, day_of_week, and month
CREATE TABLE IF NOT EXISTS `coursera-training-420312.cyclistic_bikeshare.cleaned_combined_data` AS
  SELECT 
    table1.ride_id,
    rideable_type,
    started_at,
    ended_at,
    ride_duration,
    CASE EXTRACT(DAYOFWEEK FROM started_at)
     WHEN 1 THEN 'SUN'
     WHEN 2 THEN 'MON'
     WHEN 3 THEN 'TUES'
     WHEN 4 THEN 'WED'
     WHEN 5 THEN 'THURS'
     WHEN 6 THEN 'FRI'
     WHEN 7 THEN 'SAT'
    END AS day_of_week,
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name,
    end_station_name,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,
  FROM `coursera-training-420312.cyclistic_bikeshare.combined_data` AS table1
    JOIN (
      SELECT
        ride_id,
        EXTRACT(HOUR FROM(ended_at - started_at))*60+
        EXTRACT(MINUTE FROM(ended_at - started_at))+
        EXTRACT(SECOND FROM(ended_at - started_at))/60 AS ride_duration,
      FROM `coursera-training-420312.cyclistic_bikeshare.combined_data`) AS table2
    ON table1.ride_id = table2.ride_id
  WHERE
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    ride_duration > 1 AND
    ride_duration < 1440;

ALTER TABLE `coursera-training-420312.cyclistic_bikeshare.combined_data`
ADD PRIMARY KEY(ride_id) NOT ENFORCED;
