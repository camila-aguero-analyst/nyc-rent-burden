-- =====================================================
-- Project: NYC Rent Burden Analysis
-- Purpose:
-- Clean the raw ACS Census table by:
--   1. Standardizing borough names
--   2. Converting Census estimate fields to numeric values
--   3. Keeping only the fields needed for rent-burden analysis
-- =====================================================

CREATE OR REPLACE TABLE `housing-project-508423.rent.cleaned_rent_burden` AS

SELECT
    GEO_ID AS geo_id,
    NAME AS geography_name,

    -- Convert Census county names into NYC borough names
    CASE
        WHEN NAME LIKE '%Bronx County%' THEN 'Bronx'
        WHEN NAME LIKE '%Kings County%' THEN 'Brooklyn'
        WHEN NAME LIKE '%New York County%' THEN 'Manhattan'
        WHEN NAME LIKE '%Queens County%' THEN 'Queens'
        WHEN NAME LIKE '%Richmond County%' THEN 'Staten Island'
        ELSE NULL
    END AS borough,

    -- Total renter-occupied households
    SAFE_CAST(B25070_001E AS INT64) AS total_renter_households,

    -- Gross rent as a percentage of household income
    SAFE_CAST(B25070_002E AS INT64) AS rent_under_10,
    SAFE_CAST(B25070_003E AS INT64) AS rent_10_14,
    SAFE_CAST(B25070_004E AS INT64) AS rent_15_19,
    SAFE_CAST(B25070_005E AS INT64) AS rent_20_24,
    SAFE_CAST(B25070_006E AS INT64) AS rent_25_29,
    SAFE_CAST(B25070_007E AS INT64) AS rent_30_34,
    SAFE_CAST(B25070_008E AS INT64) AS rent_35_39,
    SAFE_CAST(B25070_009E AS INT64) AS rent_40_49,
    SAFE_CAST(B25070_010E AS INT64) AS rent_50_plus,

    -- Households where gross rent percentage could not be computed
    SAFE_CAST(B25070_011E AS INT64) AS rent_not_computed

FROM `housing-project-508423.rent.raw_rent_burden`

-- Keep only NYC census tracts
WHERE
    NAME LIKE '%Bronx County%'
    OR NAME LIKE '%Kings County%'
    OR NAME LIKE '%New York County%'
    OR NAME LIKE '%Queens County%'
    OR NAME LIKE '%Richmond County%';
