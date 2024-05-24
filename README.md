<h1 align="center">
Cyclistic Bike-Share: A Comprehensive Data Analytics Case-Study
</h1>

<p align="center">
<img src=https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/3a65d86a-7a83-4b92-bcb7-e719840f282e />
</p>

## Overview

This case-study is a capstone project for the completion of [Google Data Analytics Professional Certificate Program](https://www.coursera.org/learn/google-data-analytics-capstone) where you work for a fictional company, Cyclistic, along with some key team members. In order to accomplish the business task at hand, we will follow the steps of the data analysis process: **Ask, Prepare, Process, Analyze, Share, and Act**.

**Scenario** : You are a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## ASK

**Business Task** : Understand how annual members and casual riders use Cyclistic bikes differently to device marketing strategies in converting casual riders into annual members. 

## PREPARE

The data used are the previous 12 months (**May 2023 to April 2024**) [trip data of Cyclistic Bike-Share](https://divvy-tripdata.s3.amazonaws.com/index.html) and was extracted on the 13th day of May 2024. The data came from 5,824 bicycles that are geo-tracked and locked into a network of 692 stations across Chicago. The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).

***Note:  Data-privacy issues prohibit using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.***

Each dataset contains monthly trip data and contains the following fields:
1. ride_id – the unique key for each trip
2. rideable_type – the type of bike used
3. started_at – the date and time that the use of bike started
4. ended_at - the date and time that the use of bike ended
5. start_station_name – the station where the use of bike has started 
6. start_station_id – the id for the station where the use of bike has started 
7. end_station_name – the station where the use of bike has ended 
8. end_station_id - the id for the station where the use of bike has ended
9. start_lat – the latitude of the station where the use of bike started
10. start_lng – the longitude of the station where the use of bike started
11. end_lat - the latitude of the station where the use of bike ended
12. end_lng - the longitude of the station where the use of bike ended.
13. member_casual – identifies whether the user is a member or a casual rider

## PROCESS
### Data Combination
Considering the massive amount of data that the data files contain, we will combine them through [BigQuery](https://console.cloud.google.com/projectselector2/bigquery?supportedpurview=project&authuser=1) using this [SQL query statement](https://github.com/Drik0y/Cyclistic-Case-Study/blob/main/data_combination.sql).

The query combined all the data into one table that has a total of 5,738,612 observations.
![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/823d0507-2cac-4812-8e19-c862ec9c62e4)

### Data Checking
#### Looking for Null Values
Through this [query statement](https://github.com/Drik0y/Cyclistic-Case-Study/blob/main/data_checking.sql), we found out that start_station_name and start_station_id has 885,429 null values, end_station_name and end_station_id has 939,115 null values, and end_lat and end_lng has 7,610 null values.

![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/8d3c2bbe-77fb-4891-bcf5-ea30a3a940d8)



