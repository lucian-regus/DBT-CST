WITH raw_hosts AS(
    SELECT
        *
    FROM
        {{ source('airbnb', 'raw_hosts') }}
)

SELECT
    ID AS HOST_ID, 
    NAME AS HOST_NAME,
    {{ transform_is_superhost(IS_SUPERHOST)}} AS IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
FROM        
    raw_hosts