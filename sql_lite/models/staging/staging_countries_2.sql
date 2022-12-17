
/*
    This will create the staging_countries_2 model.filtering out the country id that are null/empty. 
*/

{{ config(materialized='table') }}

with source as (
    select *
    from countries
),
staging_countries as 
(
SELECT id as country_id,country,region,
ROW_NUMBER() over(partition by id ORDER by id ) as country_id_rank from   countries where length(id) <> 0  or id is not null
)

select country_id,country,region from staging_countries
where country_id_rank = 1