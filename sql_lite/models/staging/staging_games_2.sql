
/*
   This will create the staging_games_2 model.filtering out the sports that are null/empty. 
*/

{{ config(materialized='table') }}
with source as (
select sport as sport_name,"event",year,athlete_id,country_id,Bronze as bronze,Gold as gold,Silver as silver from summer_games  where length(sport) <> 0 or sport is not null
UNION
select sport as sport_name,"event",year,athlete_id,country_id,Bronze as bronze,Gold as gold,Silver as silver from winter_games  where length(sport) <> 0 or sport is not null
)
select * from source;

