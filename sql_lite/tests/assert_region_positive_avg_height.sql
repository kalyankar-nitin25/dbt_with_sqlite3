--Check the region wise avg height should not be negative
WITH source AS (
    SELECT
        *
    FROM
        {{ ref ('vw_region_wise_avg_height_2') }}
)
SELECT
    *
FROM
    source
WHERE
   CAST(avg_height AS FLOAT) <=0.0