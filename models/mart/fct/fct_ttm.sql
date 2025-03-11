WITH int_listings_2010 AS (
    SELECT
        COUNT(*) AS COUNT_2010
    FROM
        {{ ref('int_listings') }}
    WHERE
        EXTRACT(YEAR FROM LISTING_CREATED_AT) = 2010
),
int_listings_2011 AS (
    SELECT
        COUNT(*) AS COUNT_2011
    FROM
        {{ ref('int_listings') }}
    WHERE
        EXTRACT(YEAR FROM LISTING_CREATED_AT) = 2011
)

SELECT
    CURRENT_DATE AS CURRENT_DATE,
    int_listings_2010.COUNT_2010,
    int_listings_2011.COUNT_2011
FROM
    int_listings_2010
CROSS JOIN
    int_listings_2011