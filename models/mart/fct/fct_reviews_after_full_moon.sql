WITH int_reviews AS(
    SELECT
        *
    FROM
        {{ ref('int_reviews') }}
),
full_moon_dates AS(
    SELECT
        *
    FROM
        {{ ref('seed_full_moon_dates') }}
)

SELECT
    YEAR(r.REVIEW_DATE) AS YEAR,
    COUNT(*) AS NUMBER_OF_REVIEWS_AFTER_FULL_MOON
FROM
    int_reviews r
    LEFT JOIN full_moon_dates fmd on DATEADD(DAY, 1, fmd.full_moon_date) = TO_DATE(r.REVIEW_DATE) 
WHERE
    fmd.FULL_MOON_DATE IS NOT NULL
GROUP BY 
    YEAR(r.REVIEW_DATE)