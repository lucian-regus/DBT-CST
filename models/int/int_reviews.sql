WITH stg_reviews AS(
    SELECT
        *
    FROM
        {{ ref('stg_reviews') }}
),
stg_listings AS(
    SELECT
        *
    FROM
        {{ ref('stg_listings') }}
)

SELECT
    l.LISTING_ID,
    l.LISTING_NAME,
    COMMENTS,
    SENTIMENT,
    DATE AS REVIEW_DATE,
    REVIEWER_NAME
FROM
    stg_reviews r
    LEFT JOIN stg_listings l ON l.LISTING_ID = r.LISTING_ID