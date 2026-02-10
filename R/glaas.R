#' WHO GLAAS Dataset
#'
#' The complete dataset from the UN-Water Global Analysis and Assessment of
#' Sanitation and Drinking-water (GLAAS).
#'
#' @format ## `glaas`
#' A data frame with 259313 rows and 121 variables:
#' \describe{
#'   \item{feature_id}{Unique feature identifier (FID) from the WHO xMart system}
#'   \item{language}{Language of the record (e.g., "EN")}
#'   \item{parent_location_type}{Category of the parent region (e.g., WHO Region)}
#'   \item{parent_location_type_name}{Descriptive name of the parent location type}
#'   \item{parent_loc_type_seq}{Sequence order for the parent location type}
#'   \item{parent_location_code}{ISO or regional code for the parent location}
#'   \item{parent_location_name}{Name of the parent region (e.g., Eastern Mediterranean Region)}
#'   \item{parent_loc_seq}{Sequence order for the parent location}
#'   \item{region_sdg_code}{SDG region code}
#'   \item{region_sdg_name}{SDG region name}
#'   \item{parent_loc_seq_sdg}{Sequence order for SDG regions}
#'   \item{region_world_bank_code}{World Bank income group code}
#'   \item{region_world_bank_name}{World Bank income group name}
#'   \item{parent_loc_seq_wbig}{Sequence order for World Bank income groups}
#'   \item{region_unicef_reporting_code}{UNICEF reporting region code}
#'   \item{region_unicef_reporting_name}{UNICEF reporting region name}
#'   \item{parent_loc_seq_unice_frept}{Sequence order for UNICEF reporting regions}
#'   \item{region_unicef_program_code}{UNICEF program region code}
#'   \item{region_unicef_program_name}{UNICEF program region name}
#'   \item{parent_loc_seq_unice_fprgm}{Sequence order for UNICEF program regions}
#'   \item{grand_parent}{Top-level thematic area code (e.g., FINANCE)}
#'   \item{grand_parent_text}{Top-level thematic area name}
#'   \item{grand_parent_seq}{Sequence order for thematic areas}
#'   \item{parent}{Sub-thematic area code (e.g., DOMABS for Domestic Absorption)}
#'   \item{parent_text}{Sub-thematic area name}
#'   \item{parent_seq}{Sequence order for sub-thematic areas}
#'   \item{indicator_code}{Unique code for the WASH indicator}
#'   \item{indicator_prefix}{Indicator prefix used in reports (e.g., FIN08)}
#'   \item{indicator_name}{Full descriptive name of the indicator}
#'   \item{indicator_name_highlight}{Shortened highlight name of the indicator}
#'   \item{ind_seq}{Sequence order for indicators}
#'   \item{country_type}{Type of location (e.g., Member State)}
#'   \item{country_type_name}{Descriptive name for the location type}
#'   \item{loc_type_seq}{Sequence order for location types}
#'   \item{country_code}{ISO 3-digit country code (e.g., "PAK")}
#'   \item{country_name}{Name of the country or territory}
#'   \item{loc_seq}{Sequence order for locations}
#'   \item{time_type}{Type of time period (e.g., YEAR)}
#'   \item{time_type_name}{Descriptive name for the time type}
#'   \item{time_type_seq}{Sequence order for time types}
#'   \item{time_period}{The year or period of data collection}
#'   \item{time_seq}{Sequence order for time periods}
#'   \item{data_year}{The specific year the data represents}
#'   \item{published}{Boolean indicating if the data is officially published}
#'   \item{status}{Current status of the data record}
#'   \item{published_country_highlights}{Indicates if country highlights are published}
#'   \item{is_comparable}{Boolean indicating if data is comparable across cycles}
#'   \item{is_comparable_2013, is_comparable_2016, is_comparable_2018, is_comparable_2021, is_comparable_2024}{Comparability flags for specific GLAAS cycles}
#'   \item{is_latest}{Boolean indicating if this is the most recent data point for the indicator}
#'   \item{dimension1_type}{First disaggregation dimension type (e.g., SERVICES)}
#'   \item{dimension1_type_name}{Name of the first dimension type}
#'   \item{dim1type_seq}{Sequence for dimension 1 type}
#'   \item{dimension1_value}{Value code for dimension 1 (e.g., WATER_DRNK)}
#'   \item{dimension1_value_name}{Value name for dimension 1 (e.g., Drinking-water)}
#'   \item{dim1val_seq}{Sequence for dimension 1 value}
#'   \item{dimension2_type}{Second disaggregation dimension type (e.g., SETTINGS)}
#'   \item{dimension2_type_name}{Name of the second dimension type}
#'   \item{dim2type_seq}{Sequence for dimension 2 type}
#'   \item{dimension2_value}{Value code for dimension 2 (e.g., URB for Urban)}
#'   \item{dimension2_value_name}{Value name for dimension 2}
#'   \item{dim2val_seq}{Sequence for dimension 2 value}
#'   \item{dimension3_type, dimension4_type, dimension5_type, dimension6_type}{Additional disaggregation dimension types}
#'   \item{dimension3_value, dimension4_value, dimension5_value, dimension6_value}{Additional disaggregation dimension values}
#'   \item{value_code_numeric}{The numeric value of the indicator}
#'   \item{value_code}{The categorical code for the value (if applicable)}
#'   \item{value_amount}{The absolute amount (for financial indicators)}
#'   \item{value_text}{The text representation of the value (e.g., "More than 75%")}
#'   \item{val_seq}{Sequence order for the value}
#'   \item{data_type}{Type of data (e.g., Text, Numeric)}
#'   \item{unit_of_measure}{Units for the value (e.g., %, USD)}
#'   \item{hex_color}{Color code used for data visualizations}
#'   \item{country_highlights}{Summary text for country highlights}
#'   \item{survey_round}{The GLAAS survey cycle/round}
#'   \item{comment1_type, comment2_type, comment3_type}{Types of qualitative comments provided}
#'   \item{comment1, comment2, comment3}{Actual qualitative remarks or notes}
#'   \item{record_id}{Unique internal record ID}
#'   \item{sys_primary_key}{System-level primary key}
#'   \item{sys_row_title}{System-generated title for the row}
#'   \item{sys_version, sys_version_id}{Version tracking information}
#'   \item{sys_origin_code}{Code for the data origin/source system}
#'   \item{sys_loaded_by, sys_first_loaded_by}{User or process that loaded the data}
#'   \item{sys_commit_date, sys_first_commit_date}{Timestamps for when data was committed to the database}
#'   \item{sys_id, sys_batch_id, sys_first_batch_id}{Internal system identifiers and batch processing IDs}
#' }
#' @source \url{https://glaas.who.int/}
"glaas"
