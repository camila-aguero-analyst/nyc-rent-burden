-- =====================================================
-- Project: NYC Rent Burden Analysis
-- Purpose:
-- Identify NYC census tracts with the highest levels
-- of rent burden.
--
-- Tracts are limited to those with at least 400 renter
-- households to reduce the impact of very small
-- denominators on tract-level comparisons.
-- =====================================================

SELECT
    geo_id,
    geography_name,
    borough,
    total_renter_households,
    rent_burdened_households,
    severely_rent_burdened_households,
    rent_burden_rate,
    severe_rent_burden_rate

FROM `housing-project-508423.rent.tract_rent_burden_analysis`

WHERE total_renter_households >= 400

ORDER BY rent_burden_rate DESC

LIMIT 10;
