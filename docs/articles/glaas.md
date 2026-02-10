# Get Started with glaas

## Installation

You can install `glaas` from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("openwashdata/glaas")
```

## Loading the data

``` r
library(glaas)
```

Thanks to lazy loading, the dataset is available directly after loading
the package - no need to call `data("glaas")`.

### A note on lazy loading

This package uses **lazy loading**, which means the dataset isn’t loaded
into memory until you actually use it. This keeps the package
lightweight when you first load it.

Here’s an example to illustrate the concept:

``` r
lobstr::mem_used()
#> 48.74 MB

library(glaas)
lobstr::mem_used()
#> 50.54 MB

invisible(glaas)
lobstr::mem_used()
#> 91.24 MB
```

Notice how loading the package only adds ~2 MB to memory. The full
dataset (~40 MB) is only loaded when you actually reference it.

## Overview

The `glaas` dataset contains data from the UN-Water Global Analysis and
Assessment of Sanitation and Drinking-water (GLAAS) survey. It includes
**259313 rows** and **121 variables** covering multiple survey cycles.

``` r
# Survey cycles available
unique(glaas$time_period)
#> [1] 2018 2016 2024 2021 2013

# Number of countries
length(unique(glaas$country_name))
#> [1] 151
```

## Exploring the data

``` r
# Preview the dataset
head(glaas)
#>   feature_id language parent_location_type parent_location_type_name
#> 1          5       EN           WHO Region                WHO Region
#> 2          1       EN           WHO Region                WHO Region
#> 3          7       EN           WHO Region                WHO Region
#> 4          3       EN           WHO Region                WHO Region
#> 5          6       EN           WHO Region                WHO Region
#> 6          2       EN           WHO Region                WHO Region
#>   parent_loc_type_seq parent_location_code         parent_location_name
#> 1                   3                  EMR Eastern Mediterranean Region
#> 2                   3                  EMR Eastern Mediterranean Region
#> 3                   3                  EMR Eastern Mediterranean Region
#> 4                   3                  EMR Eastern Mediterranean Region
#> 5                   3                  EMR Eastern Mediterranean Region
#> 6                   3                  EMR Eastern Mediterranean Region
#>   parent_loc_seq region_sdg_code                region_sdg_name
#> 1              3        SDG_CASA Central Asia and Southern Asia
#> 2              3        SDG_CASA Central Asia and Southern Asia
#> 3              3        SDG_CASA Central Asia and Southern Asia
#> 4              3        SDG_CASA Central Asia and Southern Asia
#> 5              3        SDG_CASA Central Asia and Southern Asia
#> 6              3        SDG_CASA Central Asia and Southern Asia
#>   parent_loc_seq_sdg region_world_bank_code region_world_bank_name
#> 1                  2                    LIC             Low income
#> 2                  2                    LIC             Low income
#> 3                  2                    LIC             Low income
#> 4                  2                    LIC             Low income
#> 5                  2                    LIC             Low income
#> 6                  2                    LIC             Low income
#>   parent_loc_seq_wbig region_unicef_reporting_code region_unicef_reporting_name
#> 1                   1                           SA                   South Asia
#> 2                   1                           SA                   South Asia
#> 3                   1                           SA                   South Asia
#> 4                   1                           SA                   South Asia
#> 5                   1                           SA                   South Asia
#> 6                   1                           SA                   South Asia
#>   parent_loc_seq_unice_frept region_unicef_program_code
#> 1                        101                         SA
#> 2                        101                         SA
#> 3                        101                         SA
#> 4                        101                         SA
#> 5                        101                         SA
#> 6                        101                         SA
#>   region_unicef_program_name parent_loc_seq_unice_fprgm grand_parent
#> 1                 South Asia                        101      FINANCE
#> 2                 South Asia                        101      FINANCE
#> 3                 South Asia                        101      FINANCE
#> 4                 South Asia                        101      FINANCE
#> 5                 South Asia                        101      FINANCE
#> 6                 South Asia                        101      FINANCE
#>   grand_parent_text grand_parent_seq parent         parent_text parent_seq
#> 1           Finance                4 DOMABS Domestic absorption          6
#> 2           Finance                4 DOMABS Domestic absorption          6
#> 3           Finance                4 DOMABS Domestic absorption          6
#> 4           Finance                4 DOMABS Domestic absorption          6
#> 5           Finance                4 DOMABS Domestic absorption          6
#> 6           Finance                4 DOMABS Domestic absorption          6
#>   indicator_code indicator_prefix
#> 1     ABSORB_DOM          [FIN08]
#> 2     ABSORB_DOM          [FIN08]
#> 3     ABSORB_DOM          [FIN08]
#> 4     ABSORB_DOM          [FIN08]
#> 5     ABSORB_DOM          [FIN08]
#> 6     ABSORB_DOM          [FIN08]
#>                                                     indicator_name
#> 1 [FIN08] Absorption of domestic capital commitments (estimated %)
#> 2 [FIN08] Absorption of domestic capital commitments (estimated %)
#> 3 [FIN08] Absorption of domestic capital commitments (estimated %)
#> 4 [FIN08] Absorption of domestic capital commitments (estimated %)
#> 5 [FIN08] Absorption of domestic capital commitments (estimated %)
#> 6 [FIN08] Absorption of domestic capital commitments (estimated %)
#>                                   indicator_name_highlight ind_seq country_type
#> 1 Absorption of domestic capital commitments (estimated %)     121 Member State
#> 2 Absorption of domestic capital commitments (estimated %)     121 Member State
#> 3 Absorption of domestic capital commitments (estimated %)     121 Member State
#> 4 Absorption of domestic capital commitments (estimated %)     121 Member State
#> 5 Absorption of domestic capital commitments (estimated %)     121 Member State
#> 6 Absorption of domestic capital commitments (estimated %)     121 Member State
#>                  country_type_name loc_type_seq country_code country_name
#> 1 Countries, territories and areas            4          AFG  Afghanistan
#> 2 Countries, territories and areas            4          AFG  Afghanistan
#> 3 Countries, territories and areas            4          AFG  Afghanistan
#> 4 Countries, territories and areas            4          AFG  Afghanistan
#> 5 Countries, territories and areas            4          AFG  Afghanistan
#> 6 Countries, territories and areas            4          AFG  Afghanistan
#>   loc_seq time_type time_type_name time_type_seq time_period time_seq data_year
#> 1     101      YEAR           Year             1        2018       23      2018
#> 2     101      YEAR           Year             1        2016       25      2016
#> 3     101      YEAR           Year             1        2018       23      2018
#> 4     101      YEAR           Year             1        2016       25      2016
#> 5     101      YEAR           Year             1        2018       23      2018
#> 6     101      YEAR           Year             1        2016       25      2016
#>   published status published_country_highlights is_comparable
#> 1      TRUE     NA                         TRUE            NA
#> 2      TRUE     NA                         TRUE            NA
#> 3      TRUE     NA                         TRUE            NA
#> 4      TRUE     NA                         TRUE            NA
#> 5      TRUE     NA                         TRUE            NA
#> 6      TRUE     NA                         TRUE            NA
#>   is_comparable_2013 is_comparable_2016 is_comparable_2018 is_comparable_2021
#> 1              FALSE               TRUE               TRUE              FALSE
#> 2              FALSE               TRUE               TRUE              FALSE
#> 3              FALSE               TRUE               TRUE              FALSE
#> 4              FALSE               TRUE               TRUE              FALSE
#> 5              FALSE               TRUE               TRUE              FALSE
#> 6              FALSE               TRUE               TRUE              FALSE
#>   is_comparable_2024 is_latest dimension1_type dimension1_type_name
#> 1              FALSE      TRUE        SERVICES              Service
#> 2              FALSE     FALSE        SERVICES              Service
#> 3              FALSE      TRUE        SERVICES              Service
#> 4              FALSE     FALSE        SERVICES              Service
#> 5              FALSE      TRUE        SERVICES              Service
#> 6              FALSE     FALSE        SERVICES              Service
#>   dim1type_seq dimension1_value dimension1_value_name dim1val_seq
#> 1            3              SAN            Sanitation           3
#> 2            3              SAN            Sanitation           3
#> 3            3              SAN            Sanitation           3
#> 4            3              SAN            Sanitation           3
#> 5            3       WATER_DRNK        Drinking-water           4
#> 6            3       WATER_DRNK        Drinking-water           4
#>   dimension2_type dimension2_type_name dim2type_seq dimension2_value
#> 1        SETTINGS              Setting            2              RUR
#> 2        SETTINGS              Setting            2              RUR
#> 3        SETTINGS              Setting            2              URB
#> 4        SETTINGS              Setting            2              URB
#> 5        SETTINGS              Setting            2              RUR
#> 6        SETTINGS              Setting            2              RUR
#>   dimension2_value_name dim2val_seq dimension3_type dimension3_type_name
#> 1                 Rural           3            <NA>                 <NA>
#> 2                 Rural           3            <NA>                 <NA>
#> 3                 Urban           2            <NA>                 <NA>
#> 4                 Urban           2            <NA>                 <NA>
#> 5                 Rural           3            <NA>                 <NA>
#> 6                 Rural           3            <NA>                 <NA>
#>   dim3type_seq dimension3_value dimension3_value_name dim3val_seq
#> 1           NA             <NA>                  <NA>          NA
#> 2           NA             <NA>                  <NA>          NA
#> 3           NA             <NA>                  <NA>          NA
#> 4           NA             <NA>                  <NA>          NA
#> 5           NA             <NA>                  <NA>          NA
#> 6           NA             <NA>                  <NA>          NA
#>   dimension4_type dimension4_type_name dim4type_seq dimension4_value
#> 1            <NA>                 <NA>           NA             <NA>
#> 2            <NA>                 <NA>           NA             <NA>
#> 3            <NA>                 <NA>           NA             <NA>
#> 4            <NA>                 <NA>           NA             <NA>
#> 5            <NA>                 <NA>           NA             <NA>
#> 6            <NA>                 <NA>           NA             <NA>
#>   dimension4_value_name dim4val_seq dimension5_type dimension5_type_name
#> 1                  <NA>          NA            <NA>                 <NA>
#> 2                  <NA>          NA            <NA>                 <NA>
#> 3                  <NA>          NA            <NA>                 <NA>
#> 4                  <NA>          NA            <NA>                 <NA>
#> 5                  <NA>          NA            <NA>                 <NA>
#> 6                  <NA>          NA            <NA>                 <NA>
#>   dim5type_seq dimension5_value dimension5_value_name dim5val_seq
#> 1           NA             <NA>                  <NA>          NA
#> 2           NA             <NA>                  <NA>          NA
#> 3           NA             <NA>                  <NA>          NA
#> 4           NA             <NA>                  <NA>          NA
#> 5           NA             <NA>                  <NA>          NA
#> 6           NA             <NA>                  <NA>          NA
#>   dimension6_type dimension6_type_name dim6type_seq dimension6_value
#> 1            <NA>                 <NA>           NA             <NA>
#> 2            <NA>                 <NA>           NA             <NA>
#> 3            <NA>                 <NA>           NA             <NA>
#> 4            <NA>                 <NA>           NA             <NA>
#> 5            <NA>                 <NA>           NA             <NA>
#> 6            <NA>                 <NA>           NA             <NA>
#>   dimension6_value_name dim6val_seq value_code_numeric  value_code value_amount
#> 1                  <NA>          NA                0.5 USE_BET5075           NA
#> 2                  <NA>          NA                1.0  USE_OVER75           NA
#> 3                  <NA>          NA                0.5 USE_BET5075           NA
#> 4                  <NA>          NA                 NA         NR7           NA
#> 5                  <NA>          NA                1.0  USE_OVER75           NA
#> 6                  <NA>          NA                1.0  USE_OVER75           NA
#>          value_text val_seq data_type unit_of_measure hex_color
#> 1 Between 50 to 75%       2      Text            <NA>   #fff176
#> 2     More than 75%       3      Text            <NA>   #2E7D32
#> 3 Between 50 to 75%       2      Text            <NA>   #fff176
#> 4       No response       9      Text            <NA>   #C7C8CA
#> 5     More than 75%       3      Text            <NA>   #0080c6
#> 6     More than 75%       3      Text            <NA>   #0080c6
#>   country_highlights survey_round comment1_type comment1_type_name comment1
#> 1                 NA           NA          <NA>               <NA>     <NA>
#> 2                 NA           NA          <NA>               <NA>     <NA>
#> 3                 NA           NA          <NA>               <NA>     <NA>
#> 4                 NA           NA          <NA>               <NA>     <NA>
#> 5                 NA           NA          <NA>               <NA>     <NA>
#> 6                 NA           NA          <NA>               <NA>     <NA>
#>   comment2_type comment2_type_name comment2 comment3_type comment3_type_name
#> 1          <NA>               <NA>     <NA>          <NA>               <NA>
#> 2          <NA>               <NA>     <NA>          <NA>               <NA>
#> 3          <NA>               <NA>     <NA>          <NA>               <NA>
#> 4          <NA>               <NA>     <NA>          <NA>               <NA>
#> 5          <NA>               <NA>     <NA>          <NA>               <NA>
#> 6          <NA>               <NA>     <NA>          <NA>               <NA>
#>   comment3                            record_id sys_primary_key sys_row_title
#> 1     <NA> 159ba6cf-464d-4d63-8b0b-a01c26b9c441     -2147483648             -
#> 2     <NA> 36d00209-635d-4cac-bc63-01859badb6e5     -2147483647             -
#> 3     <NA> be55c7a2-316f-4d1d-8c29-234a0422ec55     -2147483646             -
#> 4     <NA> 39029f4b-b5b9-46bd-8721-898bff59a922     -2147483645             -
#> 5     <NA> 0eb206c2-35bd-4e7b-a8e9-f67f16392c6f     -2147483644             -
#> 6     <NA> 3eaeece3-76ae-4de5-85cd-ea8b3b675019     -2147483643             -
#>   sys_version                         sys_version_id sys_origin_code
#> 1           1 159BA6CF-464D-4D63-8B0B-A01C26B9C441.1   SYS_DATA_LOAD
#> 2           1 36D00209-635D-4CAC-BC63-01859BADB6E5.1   SYS_DATA_LOAD
#> 3           1 BE55C7A2-316F-4D1D-8C29-234A0422EC55.1   SYS_DATA_LOAD
#> 4           1 39029F4B-B5B9-46BD-8721-898BFF59A922.1   SYS_DATA_LOAD
#> 5           1 0EB206C2-35BD-4E7B-A8E9-F67F16392C6F.1   SYS_DATA_LOAD
#> 6           1 3EAEECE3-76AE-4DE5-85CD-EA8B3B675019.1   SYS_DATA_LOAD
#>   sys_loaded_by     sys_commit_date sys_first_loaded_by sys_first_commit_date
#> 1             - 2026-01-25 05:34:09                   -   2026-01-25 05:34:09
#> 2             - 2026-01-25 05:34:09                   -   2026-01-25 05:34:09
#> 3             - 2026-01-25 05:34:09                   -   2026-01-25 05:34:09
#> 4             - 2026-01-25 05:34:09                   -   2026-01-25 05:34:09
#> 5             - 2026-01-25 05:34:09                   -   2026-01-25 05:34:09
#> 6             - 2026-01-25 05:34:09                   -   2026-01-25 05:34:09
#>                                 sys_id sys_batch_id sys_first_batch_id
#> 1 159ba6cf-464d-4d63-8b0b-a01c26b9c441      1007015            1007015
#> 2 36d00209-635d-4cac-bc63-01859badb6e5      1007015            1007015
#> 3 be55c7a2-316f-4d1d-8c29-234a0422ec55      1007015            1007015
#> 4 39029f4b-b5b9-46bd-8721-898bff59a922      1007015            1007015
#> 5 0eb206c2-35bd-4e7b-a8e9-f67f16392c6f      1007015            1007015
#> 6 3eaeece3-76ae-4de5-85cd-ea8b3b675019      1007015            1007015

# Check available thematic areas
unique(glaas$grand_parent_text)
#> [1] "Finance"         "Governance"      "Monitoring"      "Equity"         
#> [5] "Human resources"
```

For a complete description of all variables, see
[`?glaas`](https://openwashdata.github.io/glaas/reference/glaas.md).
