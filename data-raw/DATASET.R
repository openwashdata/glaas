library(httr)
library(jsonlite)
library(tidyverse)

options(scipen = 999)

base_url <- "https://xmart-api-public.who.int/WASHMART/V_MSTR_GLS_EN_66_VIEW"
page_size <- 5000
all_data <- list()
skip <- 0
continue_download <- TRUE

print("Starting download...")

while (continue_download) {
  request_url <- paste0(base_url, "?$top=", page_size, "&$skip=", skip)

  response <- GET(request_url)

  content <- fromJSON(content(response, as = "text", encoding = "UTF-8"))
  rows <- content$value

  if (length(rows) == 0 || is.null(rows)) {
    continue_download <- FALSE
    print("Download complete.")
  } else {
    all_data[[length(all_data) + 1]] <- rows
    skip <- skip + page_size
    print(paste("Downloaded", skip, "rows..."))
  }
}

glaas <- bind_rows(all_data) |>
  rename(
    # Core identifiers
    feature_id = FID,
    language = Lang,
    record_id = `_RecordID`,

    # Location information
    country_type = LocType,
    country_type_name = LocTypeText,
    country_code = Loc,
    country_name = LocText,

    # Parent location (Region)
    parent_location_type = ParentLocType,
    parent_location_type_name = ParentLocTypeText,
    parent_location_code = ParentLoc,
    parent_location_name = ParentLocText,

    # Regional classifications
    region_sdg_code = ParentLoc_SDG,
    region_sdg_name = ParentLocText_SDG,
    region_world_bank_code = ParentLoc_WBIG,
    region_world_bank_name = ParentLocText_WBIG,
    region_unicef_reporting_code = ParentLoc_UNICEFrept,
    region_unicef_reporting_name = ParentLocText_UNICEFrept,
    region_unicef_program_code = ParentLoc_UNICEFprgm,
    region_unicef_program_name = ParentLocText_UNICEFprgm,

    # Indicator information
    indicator_code = Ind,
    indicator_prefix = Prefix,
    indicator_name = IndText,
    indicator_name_highlight = IndText_HL,

    # Time information
    time_type = TimeType,
    time_type_name = TimeTypeText,
    time_period = Time,
    data_year = DataYear,

    # Publication status
    published = Published,
    published_country_highlights = Published_CH,
    status = Status,
    is_latest = IsLatest,

    # Comparability flags
    is_comparable = IsComparable,
    is_comparable_2013 = IsComparable_2013,
    is_comparable_2016 = IsComparable_2016,
    is_comparable_2018 = IsComparable_2018,
    is_comparable_2021 = IsComparable_2021,
    is_comparable_2024 = IsComparable_2024,

    # Dimension 1 (e.g., Service level)
    dimension1_type = Dim1Type,
    dimension1_type_name = Dim1TypeText,
    dimension1_value = Dim1Val,
    dimension1_value_name = Dim1ValText,

    # Dimension 2
    dimension2_type = Dim2Type,
    dimension2_type_name = Dim2TypeText,
    dimension2_value = Dim2Val,
    dimension2_value_name = Dim2ValText,

    # Dimension 3
    dimension3_type = Dim3Type,
    dimension3_type_name = Dim3TypeText,
    dimension3_value = Dim3Val,
    dimension3_value_name = Dim3ValText,

    # Dimension 4
    dimension4_type = Dim4Type,
    dimension4_type_name = Dim4TypeText,
    dimension4_value = Dim4Val,
    dimension4_value_name = Dim4ValText,

    # Dimension 5
    dimension5_type = Dim5Type,
    dimension5_type_name = Dim5TypeText,
    dimension5_value = Dim5Val,
    dimension5_value_name = Dim5ValText,

    # Dimension 6
    dimension6_type = Dim6Type,
    dimension6_type_name = Dim6TypeText,
    dimension6_value = Dim6Val,
    dimension6_value_name = Dim6ValText,

    # Value information
    value_code_numeric = ValCodeNum,
    value_code = ValCode,
    value_amount = ValAmount,
    value_text = ValText,

    # Metadata
    data_type = DataType,
    unit_of_measure = UoM,
    hex_color = HexColor,
    country_highlights = CountryHighlights,
    survey_round = Survey,

    # Comments
    comment1_type = Com1Type,
    comment1_type_name = Com1TypeText,
    comment1 = Com1,
    comment2_type = Com2Type,
    comment2_type_name = Com2TypeText,
    comment2 = Com2,
    comment3_type = Com3Type,
    comment3_type_name = Com3TypeText,
    comment3 = Com3,

    # System fields
    sys_primary_key = Sys_PK,
    sys_row_title = Sys_RowTitle,
    sys_version = Sys_Version,
    sys_version_id = Sys_VersionID,
    sys_origin_code = Sys_OriginCode,
    sys_loaded_by = Sys_LoadBy,
    sys_commit_date = Sys_CommitDateUtc,
    sys_first_loaded_by = Sys_FirstLoadBy,
    sys_first_commit_date = Sys_FirstCommitDateUtc,
    sys_id = Sys_ID,
    sys_batch_id = Sys_BatchID,
    sys_first_batch_id = Sys_FirstBatchID
  ) |>
  janitor::clean_names()

usethis::use_data(glaas, overwrite = TRUE, compress = "xz")
