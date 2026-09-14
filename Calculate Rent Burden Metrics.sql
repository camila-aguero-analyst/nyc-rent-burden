-- =====================================================
-- Project: NYC Rent Burden Analysis
-- Purpose:
-- Create tract-level rent burden measures from the
-- cleaned ACS rent-to-income categories.
-- =====================================================

CREATE OR REPLACE TABLE `housing-project-508423.rent.tract_rent_burden_analysis` AS

WITH burden_counts AS (

    SELECT
        geo_id,
        geography_name,
        borough,
        total_renter_households,

        -- Rent burden = 30% or more of household income
        (
            rent_30_34
            + rent_35_39
            + rent_40_49
            + rent_50_plus
        ) AS rent_burdened_households,

        -- Severe rent burden = 50% or more
        rent_50_plus AS severely_rent_burdened_households

    FROM `housing-project-508423.rent.cleaned_rent_burden`
)

SELECT
    geo_id,
    geography_name,
    borough,
    total_renter_households,
    rent_burdened_households,
    severely_rent_burdened_households,

    ROUND(
        SAFE_DIVIDE(
            rent_burdened_households,
            total_renter_households
        ) * 100,
        1
    ) AS rent_burden_rate,

    ROUND(
        SAFE_DIVIDE(
            severely_rent_burdened_households,
            total_renter_households
        ) * 100,
        1
    ) AS severe_rent_burden_rate

FROM burden_counts;
