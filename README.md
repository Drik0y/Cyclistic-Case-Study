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

*Note:  Data-privacy issues prohibit using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.*

Each dataset contains monthly trip data and contains the following fields:
1. ***ride_id*** – the unique key for each trip
2. ***rideable_type*** – the type of bike used
3. ***started_at*** – the date and time that the use of bike started
4. ***ended_at*** - the date and time that the use of bike ended
5. ***start_station_name*** – the station where the use of bike has started 
6. ***start_station_id*** – the id for the station where the use of bike has started 
7. ***end_station_name*** – the station where the use of bike has ended 
8. ***end_station_id*** - the id for the station where the use of bike has ended
9. ***start_lat*** – the latitude of the station where the use of bike started
10. ***start_lng*** – the longitude of the station where the use of bike started
11. ***end_lat*** - the latitude of the station where the use of bike ended
12. ***end_lng*** - the longitude of the station where the use of bike ended.
13. ***member_casual*** – identifies whether the user is a member or a casual rider

## PROCESS
### Data Combination

SQL Query for [data combination](https://github.com/Drik0y/Cyclistic-Case-Study/blob/main/data_combination.sql).

Considering the massive amount of data that the data files contain, we will combine them through [BigQuery](https://console.cloud.google.com/projectselector2/bigquery?supportedpurview=project&authuser=1) using SQL queries. 

The query combined all data into one table that has a total of 5,738,612 observations.

![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/823d0507-2cac-4812-8e19-c862ec9c62e4)

### Data Checking
All SQL queries for [data checking](https://github.com/Drik0y/Cyclistic-Case-Study/blob/main/data_checking.sql).

#### Looking for Null Values
We found out that ***start_station_name*** and ***start_station_id*** has 885,429 null values, ***end_station_name*** and ***end_station_id*** has 939,115 null values, and ***end_lat*** and ***end_lng*** has 7,610 null values.

![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/8d3c2bbe-77fb-4891-bcf5-ea30a3a940d8)

#### Checking for Inconsistent Data Types
After checking the table's schema, All column has the appropriate data types. There is no need to change the data type of any variable.
![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/42ef0d6e-fe3d-4116-bb0a-e3fe7287441d)

#### Checking for Inconsistent Primary Key
The primary key for this dataset which is ***“ride_id”***  has the string length of 16, thus, there is no inconsistency in the primary key.
![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/094255da-e1d9-4e39-9411-bb62b3f0a2ae)

#### Checking for Duplicate Observations
We counted the number of total observations and compared it to the count of distinct primary key values. There is no difference between them, therefore, we have no duplicate values.
![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/17082cfd-2a61-424c-9dbc-c7c8496d8a0d)

#### Checking for Invalid / Mispelled Bike Type Values
We queried all unique values in the *rideable_type* column and only 3 unique types of bike came from the result: electric bikes, classic bikes, and docked bikes. No mispelled or invalid type of bike values.
![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/47cc6b9d-eef3-4a10-a576-37af7b0e169a)

#### Checking for Invalid / Mispelled Type of Users
We also queried all unique values in the *member_casual* column and only 2 unique types of user came from the result: electric member and casual. No mispelled or invalid type of user values.
![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/b3195199-d3f7-4286-b968-1947490e0c6f)

#### Looking for Outliers in the Trip Duration
We checked if there are trips that did not reach the 1-minute mark. There are 139,873 trips that did not took a minute.
![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/97326712-6c00-47c4-8bbd-bbbe24d43623)

We will also checked if there are trips that are longer than a day. And, there are 8,286 trips that are longer than a day.
![image](https://github.com/Drik0y/Cyclistic-Case-Study/assets/170537437/134ff6e8-6ec4-4f3d-a7df-a5ba72f3fddc)

### Data Cleaning
SQL query for [data cleaning](https://github.com/WilmarLofranco/Cyclistic-Case-Study/blob/main/data_cleaning.sql).

We have created a new table named ***cleaned_combined_data*** where the following observations are omitted:
- Observations with trip durations that did not reach the 1-minute mark.
- Observations with trip durations that are longer than a day.
- Rows that have null station names.
- Rows that have null latitude and longitude
![image](https://github.com/WilmarLofranco/Cyclistic-Case-Study/assets/170537437/34902952-751d-4413-97f6-ce00ea02bbfa)

A total of **4,255,498 rows** are returned in the ***cleaned_combined_data*** table, removing **1,483,114 rows** from the previous ***combined_data*** table.

New columns have been added to the new table:
- ***ride_duration*** – the duration of ride in minutes calculated from the difference of timestamps of “started_at” and “ended_at”
- ***day_of_week*** – the day of the week that the trip entry occurred
- ***month*** – the name of the month that the trip occurred

## ANALYZE

SQL query for [data analysis]().

Now that data is stored appropriately and has been prepared for analysis, let's start putting it to work.
We will perform the following calculations through SQL queries and the results will be saved as tables for visualization:

- Total number of trips per type of bike by casual and member users
- Total number of trips per month
- Total number of trips per day of the week
- Total number of trips per hour of the day
- Average trip duration per month
- Average trip duration per day of the week
- Average trip duration per hour of the day
- Top 10 starting stations by casual and member users
- Top 10 ending stations by casual and member users

![image](https://github.com/WilmarLofranco/Cyclistic-Case-Study/assets/170537437/b83277f0-ddc0-4057-adec-1c4cdf1f5272)

## SHARE

Now that we have the necessary data tables, we will now import them through an online visualization tool called [**Tableau**](https://public.tableau.com/app/discover) to effectively communicate the patterns and insights we found.

This phase will be critical in answering our business question: **How annual members and casual riders use Cyclistic bikes differently?**

### Number of Trips per Bike Type 
![Dashboard 1 (1)](https://github.com/WilmarLofranco/Cyclistic-Case-Study/assets/170537437/595ec548-52ed-4b33-9244-b0843c11306e)

As we can see to the chart above, members use the bike-sharing service more often than casual users with 64% of the total trips coming from them. The most used type of bike are classic bikes, followed by electric bikes. While docked bikes are the least used bikes which only constitutes 1.07% of the total trips. This could be due to the availability of docked bikes, whatever the case is, this is one of the limitation we have in our data: *there is no data as to how many bikes are availble for each type of bike.*

### Number of Trips per Month and per Day
![Dashboard 2](https://github.com/WilmarLofranco/Cyclistic-Case-Study/assets/170537437/5a7de56b-af5e-45a7-b298-7d0d1d4a07ad)
![Dashboard 2 (2) (1)](https://github.com/WilmarLofranco/Cyclistic-Case-Study/assets/170537437/4c5bab87-3028-484a-b21a-0701738bff09)

In the monthly chart, the usage of Cyclistic's bikes peaks during summer which are the months of June to August. Then, the number of trips hits rock bottom during Winter in the months of December to February and starts to increase again during Spring in the months of April to May. This discovered pattern of riding behavior is both observable from members and casual users.

In the daily observation, members often ride during weekdays and less often in weekends. In contrast, notable increase in usage is seen from casual users during weekends and lesser on weekdays. 

In an hourly view, great number of members use the bike-sharing service around 8 in the morning and peaks around 4 to 6 in the afternoon. While trips of casual users increase consistently through out the day and continues to decrease after 6 in the afternoon.

Let's proceed with finding patterns in the trip duration.

### Average Trip Duration
![Dashboard 3](https://github.com/WilmarLofranco/Cyclistic-Case-Study/assets/170537437/30dc09c4-d858-4fcb-a1c2-78f0128ba27a)
![Dashboard 3 (2) (1)](https://github.com/WilmarLofranco/Cyclistic-Case-Study/assets/170537437/5db04c94-eac6-420e-b99f-42dc0e660728)

Though members ride more frequently, casual users ride longer than members. Their average duration of trips lasts almost twice longer than members do. Members usual ride duration lasts up to 12 minutes and this is a steady trend throughout the year, week, and day. On the other hand, casual users usually last up to 23 minutes, but abruptly grows up to 25 minutes during the summer season, weekends, and from 10 AM to 2 PM. 

### Top Start Stations
![Dashboard 6 (1)](https://github.com/WilmarLofranco/Cyclistic-Case-Study/assets/170537437/e4a9e5bc-d64b-4104-ae85-5e94228fdd95)

### Top End Stations 
![Dashboard 7](https://github.com/WilmarLofranco/Cyclistic-Case-Study/assets/170537437/659cdad7-1fa9-42d3-a321-0aa34ae8c175)



