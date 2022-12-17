-- Check Athelete name should not be empty or null
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
    length(name)==0 or name is null