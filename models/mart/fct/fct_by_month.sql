WITH dates AS (
    SELECT DISTINCT
        YEAR(REVIEW_DATE) AS YEAR,
        MONTH(REVIEW_DATE) AS MONTH,
        COUNT(*) AS CURRENT_MONTH_REVIEWS
    FROM
        {{ ref('int_reviews') }}
    GROUP BY 
        YEAR(REVIEW_DATE),
        MONTH(REVIEW_DATE)
)

SELECT
    d1.YEAR,
    d1.MONTH,
    d1.CURRENT_MONTH_REVIEWS
FROM
    dates d1