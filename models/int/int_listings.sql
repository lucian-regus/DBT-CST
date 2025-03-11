WITH stg_listings AS(
    SELECT
        *
    FROM
        {{ ref('stg_listings') }}
),
stg_hosts AS(
    SELECT
        *
    FROM
        {{ ref('stg_hosts') }}
)

SELECT
    l.LISTING_ID,
    h.HOST_ID,
    l.LISTING_NAME,
    h.HOST_NAME,
    l.PRICE,
    l.ROOM_TYPE,
    l.MINIMUM_NIGHTS,
    l.LISTING_URL,
    l.CREATED_AT AS LISTING_CREATED_AT,
    l.UPDATED_AT AS LISTING_UPDATED_AT
FROM
    stg_listings l
    LEFT JOIN stg_hosts h ON h.HOST_ID = l.HOST_ID