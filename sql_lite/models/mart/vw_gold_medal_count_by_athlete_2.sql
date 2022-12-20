
/*
   This will create the vw_gold_medal_count_by_athlete_2 model.model contains the atheletes who won more than equal to 3 golds.
*/

{{ config(materialized='view') }}

with source as (
select a."name", count(g.gold) as total_gold_medals from
{{ ref('staging_games_2') }} g , {{ ref('staging_athletes_2') }} a
where g.athlete_id=a.athlete_id
group by 1
having total_gold_medals >=3
order by total_gold_medals desc
)
select * from source