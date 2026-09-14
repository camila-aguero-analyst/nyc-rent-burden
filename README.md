## NYC Rent Burden Analysis

## Overview

This project explores housing affordability across New York City using 2024 American Community Survey (ACS) data from the U.S. Census Bureau.

The goal was to analyze the percentage of renter households spending 30% or more of their household income on gross rent and compare rent burden across NYC boroughs and census tracts.

## Tools

- SQL / Google BigQuery
- Tableau

## Analysis

I used SQL to clean and transform the Census data, calculate rent-burden metrics, and analyze differences across boroughs and census tracts.

Rent burden was defined as spending **30% or more of household income on gross rent**, while severe rent burden was defined as spending **50% or more**.

For tract-level comparisons, I limited the analysis to census tracts with at least **400 renter households** to reduce the influence of very small populations on percentage-based rankings.

## Key Findings

- The Bronx had the highest borough-level rent burden rate at **56.9%**.
- Manhattan had the lowest rate at **45.9%**.
- Several census tracts had rent burden rates above **80%**.
- Tract-level analysis revealed concentrated areas of housing affordability pressure that were less visible in borough-wide averages.

## Data Source

U.S. Census Bureau  
American Community Survey (ACS) 2024 5-Year Estimates  
Table B25070: Gross Rent as a Percentage of Household Income in the Past 12 Months

## SQL Files

- `Clean Rent Burden Data.sql` — Cleans and prepares the Census data.
- `Calculate Rent Burden Metrics.sql` — Calculates rent burden and severe rent burden.
- `Borough-Level Rent Burden Analysis.sql` — Compares weighted rent burden rates across NYC boroughs.
- `Cencus Tract Burden Analysis.sql` — Identifies census tracts with the highest rent burden.

## Dashboard

View the interactive Tableau dashboard: **[Add Tableau Public Link]**
