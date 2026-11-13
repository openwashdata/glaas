# WHO GLAAS Dataset

The complete dataset from the UN-Water Global Analysis and Assessment of
Sanitation and Drinking-water (GLAAS).

## Usage

``` r
glaas
```

## Format

A tibble with 259546 rows and 121 variables

- feature_id:

  Numeric identifier of the record in the WHO source table (source
  column FID). Each of the 259,546 rows has its own value.

- language:

  Language of the text columns. Every row holds "EN" for English.

- parent_location_type:

  Type of the region that the country is grouped under. Every row holds
  "WHO Region".

- parent_location_type_name:

  Display name of the region type. Every row holds "WHO Region".

- parent_loc_type_seq:

  Sort order number from the WHO source table (source column
  ParentLocTypeSeq). In this dataset it holds the same value as
  parent_loc_seq, 1 to 6.

- parent_location_code:

  Code of the WHO region of the country: AFR, AMR, EMR, EUR, SEAR or
  WPR.

- parent_location_name:

  Name of the WHO region of the country, for example "African Region".

- parent_loc_seq:

  Sort order number of the WHO region, 1 to 6.

- region_sdg_code:

  Code of the Sustainable Development Goal (SDG) region of the country,
  for example "SDG_SSA".

- region_sdg_name:

  Name of the SDG region of the country, for example "Sub-Saharan
  Africa".

- parent_loc_seq_sdg:

  Sort order number of the SDG region.

- region_world_bank_code:

  Code of the World Bank income group of the country: LIC, LMC, UMC or
  HIC. Missing for Anguilla, Cook Islands and Venezuela (Bolivarian
  Republic of).

- region_world_bank_name:

  Name of the World Bank income group of the country: "Low income",
  "Lower middle income", "Upper middle income" or "High income".

- parent_loc_seq_wbig:

  Sort order number of the World Bank income group, from 1 for low
  income to 4 for high income.

- region_unicef_reporting_code:

  Code of the UNICEF reporting region of the country, for example "SSA".

- region_unicef_reporting_name:

  Name of the UNICEF reporting region of the country, for example
  "Sub-Saharan Africa".

- parent_loc_seq_unice_frept:

  Sort order number from the WHO source table (source column
  ParentLocSeq_UNICEFrept). In this dataset it holds the same value as
  loc_seq, one number per country.

- region_unicef_program_code:

  Code of the UNICEF programme region of the country, for example "ESA".
  Missing for 12 countries.

- region_unicef_program_name:

  Name of the UNICEF programme region of the country, for example
  "Eastern and Southern Africa". Missing for 12 countries.

- parent_loc_seq_unice_fprgm:

  Sort order number from the WHO source table (source column
  ParentLocSeq_UNICEFprgm). In this dataset it holds the same value as
  loc_seq, one number per country.

- grand_parent:

  Code of the thematic area of the indicator: EQUITY, FINANCE, GOV,
  HUMRES or MONITOR.

- grand_parent_text:

  Name of the thematic area of the indicator: "Equity", "Finance",
  "Governance", "Human resources" or "Monitoring".

- grand_parent_seq:

  Sort order number of the thematic area, 1 to 5.

- parent:

  Code of the topic that the indicator belongs to within its thematic
  area, for example "BUDGET".

- parent_text:

  Name of the topic that the indicator belongs to, for example
  "Budgets".

- parent_seq:

  Sort order number of the topic within its thematic area.

- indicator_code:

  Code of the indicator, for example "ABSORB_DOM". The dataset holds 333
  indicators.

- indicator_prefix:

  Reference label of the indicator, written in square brackets, for
  example FIN08 for a finance indicator.

- indicator_name:

  Full name of the indicator, starting with its reference label.

- indicator_name_highlight:

  Name of the indicator without the reference label (source column
  IndText_HL). For some indicators the wording is shorter than in
  indicator_name.

- ind_seq:

  Sort order number of the indicator.

- country_type:

  Type of the location: "Member State" or "Territory or Area".

- country_type_name:

  Display name of the location type: "Countries, territories and areas"
  or "Territory or Area".

- loc_type_seq:

  Sort order number of the location type: 4 for Member State, 6 for
  Territory or Area.

- country_code:

  Three letter ISO 3166-1 code of the country, territory or area, for
  example "AFG".

- country_name:

  Name of the country, territory or area. The dataset holds 151 of them.

- loc_seq:

  Sort order number of the country, territory or area.

- time_type:

  Type of the time period. Every row holds "YEAR".

- time_type_name:

  Display name of the type of time period. Every row holds "Year".

- time_type_seq:

  Sort order number of the type of time period. Every row holds 1.

- time_period:

  Year that names the GLAAS survey cycle the record comes from: 2013,
  2016, 2018, 2021 or 2024.

- time_seq:

  Sort order number of the survey cycle. Newer cycles have lower
  numbers, from 17 for 2024 to 28 for 2013.

- data_year:

  Year that the value refers to. It equals time_period in most rows and
  differs where a country gave another year, such as a baseline year, a
  target year or a financial year (1987 to 2050).

- published:

  Whether the record is published. Every row holds TRUE.

- status:

  Status of the record in the WHO source table. Empty in every row.

- published_country_highlights:

  Flag from the WHO source table (source column Published_CH). The name
  suggests that it marks whether the record is published in the GLAAS
  country highlights.

- is_comparable:

  General comparability flag from the WHO source table. Empty in every
  row.

- is_comparable_2013:

  Flag from the WHO source table (source column IsComparable_2013). The
  name suggests that it marks whether the record can be compared with
  the 2013 survey cycle.

- is_comparable_2016:

  Flag from the WHO source table (source column IsComparable_2016). The
  name suggests that it marks whether the record can be compared with
  the 2016 survey cycle.

- is_comparable_2018:

  Flag from the WHO source table (source column IsComparable_2018). The
  name suggests that it marks whether the record can be compared with
  the 2018 survey cycle.

- is_comparable_2021:

  Flag from the WHO source table (source column IsComparable_2021). The
  name suggests that it marks whether the record can be compared with
  the 2021 survey cycle.

- is_comparable_2024:

  Flag from the WHO source table (source column IsComparable_2024). The
  name suggests that it marks whether the record can be compared with
  the 2024 survey cycle.

- is_latest:

  TRUE for the record from the most recent survey cycle in which the
  country has a value for this indicator and this combination of
  dimensions.

- dimension1_type:

  Code of the first breakdown of the indicator. Every row holds
  "SERVICES".

- dimension1_type_name:

  Name of the first breakdown of the indicator. Every row holds
  "Service".

- dim1type_seq:

  Sort order number of the type of the first breakdown. Every row holds
  3.

- dimension1_value:

  Code of the service that the record refers to, for example "SAN",
  "WATER_DRNK", "HYG" or "WASH".

- dimension1_value_name:

  Name of the service that the record refers to, for example
  "Sanitation", "Drinking-water", "Hygiene" or "WASH".

- dim1val_seq:

  Sort order number of the service.

- dimension2_type:

  Code of the second breakdown of the indicator: "SETTINGS" or
  "SUBSERVICES".

- dimension2_type_name:

  Name of the second breakdown of the indicator: "Setting" or
  "Sub-service".

- dim2type_seq:

  Sort order number of the type of the second breakdown: 2 for Setting,
  4 for Sub-service.

- dimension2_value:

  Code of the setting or sub-service that the record refers to, for
  example "RUR", "URB" or "NAT".

- dimension2_value_name:

  Name of the setting or sub-service that the record refers to, for
  example "Rural", "Urban" or "National\*". The GLAAS data portal notes
  that "national" refers to countries, territories and areas.

- dim2val_seq:

  Sort order number of the setting or sub-service. Missing in 105 rows.

- dimension3_type:

  Code of the third breakdown of the indicator, for example "SETTINGS",
  "ACTIONS" or "DOCUMENTS". Missing where the record has no third
  breakdown.

- dimension3_type_name:

  Name of the third breakdown of the indicator, for example "Setting",
  "Actions" or "Document". Missing where the record has no third
  breakdown.

- dim3type_seq:

  Sort order number of the type of the third breakdown.

- dimension3_value:

  Code of the category of the third breakdown that the record refers to,
  for example "NAT".

- dimension3_value_name:

  Name of the category of the third breakdown that the record refers to,
  for example "National\*".

- dim3val_seq:

  Sort order number of the category of the third breakdown.

- dimension4_type:

  Code of the fourth breakdown of the indicator: "ACTIONS", "DETAIL" or
  "DOCUMENTS". Missing where the record has no fourth breakdown.

- dimension4_type_name:

  Name of the fourth breakdown of the indicator: "Actions", "Details" or
  "Document". Missing where the record has no fourth breakdown.

- dim4type_seq:

  Sort order number of the type of the fourth breakdown.

- dimension4_value:

  Code of the category of the fourth breakdown that the record refers
  to, for example "STDS_REGS".

- dimension4_value_name:

  Name of the category of the fourth breakdown that the record refers
  to, for example "Standards or regulations".

- dim4val_seq:

  Sort order number of the category of the fourth breakdown.

- dimension5_type:

  Code of the fifth breakdown of the indicator: "DETAIL" or "ACTIONS".
  Missing where the record has no fifth breakdown.

- dimension5_type_name:

  Name of the fifth breakdown of the indicator: "Details" or "Actions".
  Missing where the record has no fifth breakdown.

- dim5type_seq:

  Sort order number of the type of the fifth breakdown.

- dimension5_value:

  Code of the category of the fifth breakdown that the record refers to,
  for example "SUFFIC".

- dimension5_value_name:

  Name of the category of the fifth breakdown that the record refers to,
  for example "Sufficiency".

- dim5val_seq:

  Sort order number of the category of the fifth breakdown.

- dimension6_type:

  Code of the sixth breakdown of the indicator. It holds "DETAIL" in 345
  rows and is missing in all others.

- dimension6_type_name:

  Name of the sixth breakdown of the indicator. It holds "Details" in
  345 rows and is missing in all others.

- dim6type_seq:

  Sort order number of the type of the sixth breakdown. It holds 7 in
  345 rows and is missing in all others.

- dimension6_value:

  Code of the category of the sixth breakdown. It holds "REQTS" in 345
  rows and is missing in all others.

- dimension6_value_name:

  Name of the category of the sixth breakdown. It holds "Requirements"
  in 345 rows and is missing in all others.

- dim6val_seq:

  Sort order number of the category of the sixth breakdown. It holds 83
  in 345 rows and is missing in all others.

- value_code_numeric:

  The value as a number (source column ValCodeNum). For records of data
  type "Decimal" it is the reported number. For records of data type
  "Text" it is a number given to the answer, for example 1 for "Yes" and
  0 for "No", and it is missing for "No response" and "Not applicable".

- value_code:

  Code of the answer for records of data type "Text", for example "YES",
  "NO" or "NR" for no response. Missing for records of data type
  "Decimal".

- value_amount:

  The reported number for records of data type "Decimal", rounded to two
  decimal places, in the unit named in unit_of_measure. Missing for
  records of data type "Text".

- value_text:

  The value as text: the wording of the answer for records of data type
  "Text", and the number written as text for records of data type
  "Decimal".

- val_seq:

  Sort order number of the answer within the indicator. "No response"
  has the number 9 or 11. Missing for records of data type "Decimal".

- data_type:

  Type of the value: "Text" for an answer from a list of answers,
  "Decimal" for a number.

- unit_of_measure:

  Unit of the number in value_amount: "%", "US\$" or "US\$ millions".
  Missing for records of data type "Text" and for numbers without a
  unit, such as counts and years.

- hex_color:

  Hex colour code given to the answer in the WHO source table, for
  example "#F68620". Missing for records of data type "Decimal" and for
  29 records of data type "Text".

- country_highlights:

  Country highlights field of the WHO source table. Empty in every row.

- survey_round:

  Survey field of the WHO source table. Empty in every row.

- comment1_type:

  Code for the kind of extra information in comment1, for example
  "BASE_YEAR", "FINANCIAL_YEAR" or "DESC". Missing where the record has
  no first comment.

- comment1_type_name:

  Name of the kind of extra information in comment1, for example
  "Baseline year", "Financial year" or "Description".

- comment1:

  First piece of extra information that the country gave with the value,
  stored as text in the language of the answer, for example a year, a
  description or the name of a ministry.

- comment2_type:

  Code for the kind of extra information in comment2, for example
  "YRAPPROVE", "TARGET_YEAR" or "POPULATION". Missing where the record
  has no second comment.

- comment2_type_name:

  Name of the kind of extra information in comment2, for example "Year
  approved", "Target year" or "Population (000s)". Missing for some
  codes.

- comment2:

  Second piece of extra information that goes with the value, stored as
  text, for example a year, a population figure or a reference.

- comment3_type:

  Code for the kind of extra information in comment3, for example
  "POLICY", "COST", "YEAR" or "GDP". Missing where the record has no
  third comment.

- comment3_type_name:

  Name of the kind of extra information in comment3, for example
  "Policy", "Cost", "Year" or "Gross domestic product (millions)".
  Missing for some codes.

- comment3:

  Third piece of extra information that goes with the value, stored as
  text, for example the name of a policy, a cost or a year.

- record_id:

  Unique identifier of the record in the WHO source table. It holds the
  same value as sys_id.

- sys_primary_key:

  Unique whole number key of the row in the WHO xMart database.

- sys_row_title:

  Row title field of the WHO xMart database. Every row holds "-".

- sys_version:

  Version number of the record in the WHO xMart database: 1, 2 or 3.

- sys_version_id:

  Identifier of the record version: the record identifier in capital
  letters, a dot and the version number.

- sys_origin_code:

  Code of the process that wrote the record to the WHO xMart database:
  "SYS_DATA_LOAD" or "PIPE_PUBLISH_CH".

- sys_loaded_by:

  Field of the WHO xMart database for who loaded the record. Every row
  holds "-".

- sys_commit_date:

  Date and time in UTC when the current version of the record was
  written to the WHO xMart database, between 20 and 23 July 2026.

- sys_first_loaded_by:

  Field of the WHO xMart database for who first loaded the record. Every
  row holds "-".

- sys_first_commit_date:

  Date and time in UTC when the record was first written to the WHO
  xMart database, between 20 and 23 July 2026.

- sys_id:

  Unique identifier of the record in the WHO xMart database. It holds
  the same value as record_id.

- sys_batch_id:

  Number of the load batch that wrote the current version of the record
  to the WHO xMart database.

- sys_first_batch_id:

  Number of the load batch that first wrote the record to the WHO xMart
  database.

## Source

<https://glaas.who.int/>
