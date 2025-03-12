{{ 
config(
    materialized = 'incremental',
    on_schema_change = 'fail',
    unique_key = 'LISTING_ID'
) 
}}

WITH raw_reviews AS(
    SELECT
        *
    FROM
        {{ source('airbnb', 'raw_reviews') }}
)

SELECT
    LISTING_ID, 
    COMMENTS,
    SENTIMENT,
    DATE,
    REVIEWER_NAME
FROM        
    raw_reviews
WHERE
    COMMENTS IS NOT NULL
{% if is_incremental() %}
    AND DATE > (
        SELECT
            MAX(DATE)
        FROM
            {{ this }}
    )
{% endif %}