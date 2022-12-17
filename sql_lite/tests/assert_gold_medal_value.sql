-- Check gold medal value should be >=3 
WITH source AS (
    SELECT
        *
    FROM
        {{ ref ('vw_gold_medal_count_by_athlete_2') }}
)
SELECT
    *
FROM
    source
WHERE
    total_gold_medals < 3