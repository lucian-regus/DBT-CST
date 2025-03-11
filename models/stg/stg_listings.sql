WITH raw_listings AS(
    SELECT
        *
    FROM
        {{ source('airbnb', 'raw_listings') }}
)

SELECT
    ID AS LISTING_ID, 
    NAME AS LISTING_NAME,
    PRICE,
    ROOM_TYPE,
    MINIMUM_NIGHTS,
    HOST_ID,
    LISTING_URL,
    CREATED_AT,
    UPDATED_AT
FROM        
    raw_listings