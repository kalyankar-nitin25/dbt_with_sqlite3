-- Check value of height column should not be negative
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
   CAST(height AS INTEGER) < 0