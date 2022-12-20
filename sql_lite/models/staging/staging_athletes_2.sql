
/*
    This will create the staging_atheletes_2 model.filtering out the athelete id that are null/empty. 
*/

{{ config(materialized='table') }}
with source as (
    select *
    from athletes
), 
staging_athletes_2 as 
(
SELECT id as athlete_id,"name",gender,age,height,weight,ROW_NUMBER() over(partition by id ORDER by id )  as id_rank 
from source where length(id) <> 0 or id is not null
)
select athlete_id,"name",gender,age,height,weight from staging_athletes_2
where id_rank = 1