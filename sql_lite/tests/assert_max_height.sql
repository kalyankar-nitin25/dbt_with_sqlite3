-- Check value of height column should not be > 272. as this is highest height in the world.
WITH source AS (
    SELECT
        *
    FROM
        {{ ref ('staging_athletes_2') }}
)
SELECT
    *
FROM
    source
WHERE
    CAST(height AS INTEGER) > 272  