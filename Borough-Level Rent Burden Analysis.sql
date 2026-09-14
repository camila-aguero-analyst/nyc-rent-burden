-- =====================================================
-- Project: NYC Rent Burden Analysis
-- Purpose:
-- Compare rent burden across NYC's five boroughs.
--
-- Borough rates are calculated using total household
-- counts rather than averaging census tract percentages.
-- =====================================================

SELECT
    borough,

    -- Total renter households
    SUM(total_renter_households) AS total_renter_households,

    -- Total rent-burdened households
    SUM(rent_burdened_households) AS rent_burdened_households,

    -- Total severely rent-burdened households
    SUM(severely_rent_burdened_households)
        AS severely_rent_burdened_households,

    -- Weighted borough rent burden rate
    ROUND(
        SAFE_DIVIDE(
            SUM(rent_burdened_households),
            SUM(total_renter_households)
        ) * 100,
        1
    ) AS rent_burden_rate,

    -- Weighted borough severe rent burden rate
    ROUND(
        SAFE_DIVIDE(
            SUM(severely_rent_burdened_households),
            SUM(total_renter_households)
        ) * 100,
        1
    ) AS severe_rent_burden_rate

FROM `housing-project-508423.rent.tract_rent_burden_analysis`

GROUP BY borough

ORDER BY rent_burden_rate DESC;
