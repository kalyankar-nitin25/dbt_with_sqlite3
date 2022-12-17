
/*
  This will create the vw_region_wise_avg_height_2 model.model contains the region wise average of the second tallest height of country.
*/

{{ config(materialized='view') }}

with source as (
select a.athlete_id,a."name",c.country, a.height,sport_name,"event" ,region,DENSE_RANK() OVER ( partition by c.country order by a.height desc )  as rnk from
{{ ref('staging_games_2') }} g, {{ ref('staging_countries_2') }} c  , {{ ref('staging_athletes_2') }} a 
where c.country_id=g.country_id and g.athlete_id = a.athlete_id
)
select region, round(AVG(height),2)  as avg_height from source where rnk=2
and length(region) <> 0
GROUP by 1