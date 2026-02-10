# WHO GLAAS Dataset

The complete dataset from the UN-Water Global Analysis and Assessment of
Sanitation and Drinking-water (GLAAS).

## Usage

``` r
glaas
```

## Format

### `glaas`

A data frame with 259313 rows and 121 variables:

- feature_id:

  Unique feature identifier (FID) from the WHO xMart system

- language:

  Language of the record (e.g., "EN")

- parent_location_type:

  Category of the parent region (e.g., WHO Region)

- parent_location_type_name:

  Descriptive name of the parent location type

- parent_loc_type_seq:

  Sequence order for the parent location type

- parent_location_code:

  ISO or regional code for the parent location

- parent_location_name:

  Name of the parent region (e.g., Eastern Mediterranean Region)

- parent_loc_seq:

  Sequence order for the parent location

- region_sdg_code:

  SDG region code

- region_sdg_name:

  SDG region name

- parent_loc_seq_sdg:

  Sequence order for SDG regions

- region_world_bank_code:

  World Bank income group code

- region_world_bank_name:

  World Bank income group name

- parent_loc_seq_wbig:

  Sequence order for World Bank income groups

- region_unicef_reporting_code:

  UNICEF reporting region code

- region_unicef_reporting_name:

  UNICEF reporting region name

- parent_loc_seq_unice_frept:

  Sequence order for UNICEF reporting regions

- region_unicef_program_code:

  UNICEF program region code

- region_unicef_program_name:

  UNICEF program region name

- parent_loc_seq_unice_fprgm:

  Sequence order for UNICEF program regions

- grand_parent:

  Top-level thematic area code (e.g., FINANCE)

- grand_parent_text:

  Top-level thematic area name

- grand_parent_seq:

  Sequence order for thematic areas

- parent:

  Sub-thematic area code (e.g., DOMABS for Domestic Absorption)

- parent_text:

  Sub-thematic area name

- parent_seq:

  Sequence order for sub-thematic areas

- indicator_code:

  Unique code for the WASH indicator

- indicator_prefix:

  Indicator prefix used in reports (e.g., FIN08)

- indicator_name:

  Full descriptive name of the indicator

- indicator_name_highlight:

  Shortened highlight name of the indicator

- ind_seq:

  Sequence order for indicators

- country_type:

  Type of location (e.g., Member State)

- country_type_name:

  Descriptive name for the location type

- loc_type_seq:

  Sequence order for location types

- country_code:

  ISO 3-digit country code (e.g., "PAK")

- country_name:

  Name of the country or territory

- loc_seq:

  Sequence order for locations

- time_type:

  Type of time period (e.g., YEAR)

- time_type_name:

  Descriptive name for the time type

- time_type_seq:

  Sequence order for time types

- time_period:

  The year or period of data collection

- time_seq:

  Sequence order for time periods

- data_year:

  The specific year the data represents

- published:

  Boolean indicating if the data is officially published

- status:

  Current status of the data record

- published_country_highlights:

  Indicates if country highlights are published

- is_comparable:

  Boolean indicating if data is comparable across cycles

- is_comparable_2013, is_comparable_2016, is_comparable_2018,
  is_comparable_2021, is_comparable_2024:

  Comparability flags for specific GLAAS cycles

- is_latest:

  Boolean indicating if this is the most recent data point for the
  indicator

- dimension1_type:

  First disaggregation dimension type (e.g., SERVICES)

- dimension1_type_name:

  Name of the first dimension type

- dim1type_seq:

  Sequence for dimension 1 type

- dimension1_value:

  Value code for dimension 1 (e.g., WATER_DRNK)

- dimension1_value_name:

  Value name for dimension 1 (e.g., Drinking-water)

- dim1val_seq:

  Sequence for dimension 1 value

- dimension2_type:

  Second disaggregation dimension type (e.g., SETTINGS)

- dimension2_type_name:

  Name of the second dimension type

- dim2type_seq:

  Sequence for dimension 2 type

- dimension2_value:

  Value code for dimension 2 (e.g., URB for Urban)

- dimension2_value_name:

  Value name for dimension 2

- dim2val_seq:

  Sequence for dimension 2 value

- dimension3_type, dimension4_type, dimension5_type, dimension6_type:

  Additional disaggregation dimension types

- dimension3_value, dimension4_value, dimension5_value,
  dimension6_value:

  Additional disaggregation dimension values

- value_code_numeric:

  The numeric value of the indicator

- value_code:

  The categorical code for the value (if applicable)

- value_amount:

  The absolute amount (for financial indicators)

- value_text:

  The text representation of the value (e.g., "More than 75%")

- val_seq:

  Sequence order for the value

- data_type:

  Type of data (e.g., Text, Numeric)

- unit_of_measure:

  Units for the value (e.g., %, USD)

- hex_color:

  Color code used for data visualizations

- country_highlights:

  Summary text for country highlights

- survey_round:

  The GLAAS survey cycle/round

- comment1_type, comment2_type, comment3_type:

  Types of qualitative comments provided

- comment1, comment2, comment3:

  Actual qualitative remarks or notes

- record_id:

  Unique internal record ID

- sys_primary_key:

  System-level primary key

- sys_row_title:

  System-generated title for the row

- sys_version, sys_version_id:

  Version tracking information

- sys_origin_code:

  Code for the data origin/source system

- sys_loaded_by, sys_first_loaded_by:

  User or process that loaded the data

- sys_commit_date, sys_first_commit_date:

  Timestamps for when data was committed to the database

- sys_id, sys_batch_id, sys_first_batch_id:

  Internal system identifiers and batch processing IDs

## Source

<https://glaas.who.int/>
