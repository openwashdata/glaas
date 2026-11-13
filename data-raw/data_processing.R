# Description ------------------------------------------------------------------
# R script to process the GLAAS table of the WHO data platform xMart into the
# dataset of the package. The script reads the dated snapshot of the source in
# data-raw/ when it is present, so the data rebuild without a connection. It
# pulls from the WHO source only when no snapshot of that date exists.
#
# To update the data: set snapshot_date to the day of the new pull and run the
# script from the package root. Then run washr::update_dictionary() and write
# the descriptions of new variables.
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "dplyr", "tibble",
##                    "janitor", "httr", "jsonlite", "openxlsx"))
library(usethis)
library(fs)
library(here)
library(readr)
library(dplyr)

options(scipen = 999)

source_url <- "https://xmart-api-public.who.int/WASHMART/V_MSTR_GLS_EN_66_VIEW"
snapshot_date <- "2026-11-13"
snapshot <- here::here(
  "data-raw", paste0(snapshot_date, "-glaas-who-pull.csv.xz")
)

# Pull data --------------------------------------------------------------------
# Only when the snapshot is missing. The table is read in pages of 5000 rows,
# ordered by the row key of the source, and written to the snapshot as it
# arrives: all 121 columns under the WHO names, missing values as empty cells.
if (!file.exists(snapshot)) {
  page_size <- 5000
  pages <- list()
  skip <- 0
  repeat {
    response <- httr::RETRY(
      "GET", source_url,
      query = list(`$top` = page_size, `$skip` = skip, `$orderby` = "Sys_PK"),
      httr::user_agent("glaas R data package (https://github.com/openwashdata/glaas)"),
      times = 5
    )
    httr::stop_for_status(response)
    rows <- jsonlite::fromJSON(
      httr::content(response, as = "text", encoding = "UTF-8")
    )$value
    if (is.null(rows) || length(rows) == 0) break
    pages[[length(pages) + 1]] <- rows
    skip <- skip + page_size
    message("Downloaded ", skip, " rows")
  }
  readr::write_csv(dplyr::bind_rows(pages), snapshot, na = "")
}

# Read data --------------------------------------------------------------------
# The column types are set here and not guessed, so every build gives the same
# classes. Columns that are not named are text. Status and Survey are empty in
# the source and are read as logical, as in version 0.2.0. A text cell that
# reads "NA" (179 comment cells in the pull of 2026-11-13) is read as missing,
# as in version 0.2.0.
numeric_cols <- c(
  "FID", "ParentLocTypeSeq", "ParentLocSeq", "ParentLocSeq_SDG",
  "ParentLocSeq_WBIG", "ParentLocSeq_UNICEFrept", "ParentLocSeq_UNICEFprgm",
  "GrandParentSeq", "ParentSeq", "IndSeq", "LocTypeSeq", "LocSeq",
  "TimeTypeSeq", "Time", "TimeSeq", "DataYear", "Dim1TypeSeq", "Dim1ValSeq",
  "Dim2TypeSeq", "Dim2ValSeq", "Dim3TypeSeq", "Dim3ValSeq", "Dim4TypeSeq",
  "Dim4ValSeq", "Dim5TypeSeq", "Dim5ValSeq", "Dim6TypeSeq", "Dim6ValSeq",
  "ValCodeNum", "ValAmount", "ValSeq", "Sys_PK", "Sys_Version", "Sys_BatchID",
  "Sys_FirstBatchID"
)
logical_cols <- c(
  "Published", "Status", "Published_CH", "IsComparable", "IsComparable_2013",
  "IsComparable_2016", "IsComparable_2018", "IsComparable_2021",
  "IsComparable_2024", "IsLatest", "CountryHighlights", "Survey"
)
datetime_cols <- c("Sys_CommitDateUtc", "Sys_FirstCommitDateUtc")

typed <- function(cols, collector) {
  stats::setNames(rep(list(collector), length(cols)), cols)
}
col_types <- do.call(readr::cols, c(
  typed(numeric_cols, readr::col_double()),
  typed(logical_cols, readr::col_logical()),
  typed(datetime_cols, readr::col_datetime()),
  list(.default = readr::col_character())
))

raw <- readr::read_csv(snapshot, col_types = col_types, na = c("", "NA"))
stopifnot(
  "A value in the snapshot does not fit its column type." =
    nrow(readr::problems(raw)) == 0,
  "A typed column is missing in the snapshot." =
    all(c(numeric_cols, logical_cols, datetime_cols) %in% names(raw))
)

# Tidy data --------------------------------------------------------------------
# The rows stay in the order of the source. The columns get readable names;
# a column that is not listed here keeps its WHO name in snake case.
glaas <- raw |>
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

# A plain tibble: the import details that readr attaches to the object are
# dropped. The two load times are in UTC.
glaas <- tibble::as_tibble(as.data.frame(glaas))

# The dictionary has one row per variable. Stop when it does not match.
dictionary <- readr::read_csv(
  here::here("data-raw", "dictionary.csv"), show_col_types = FALSE
)
stopifnot(
  "data-raw/dictionary.csv does not match the variables; run washr::update_dictionary()." =
    setequal(dictionary$variable_name, names(glaas))
)

# Source state -----------------------------------------------------------------
# The row count and the newest load time of the source at the pull. The monthly
# check in .github/workflows/check-source.yaml compares them with the source.
source_state <- list(
  source = source_url,
  pulled = snapshot_date,
  rows = nrow(glaas),
  newest_load_utc = format(
    max(glaas$sys_commit_date), "%Y-%m-%dT%H:%M:%OS3Z", tz = "UTC"
  )
)
writeLines(
  jsonlite::toJSON(source_state, auto_unbox = TRUE, pretty = TRUE),
  here::here("data-raw", "source-state.json")
)

# Export Data ------------------------------------------------------------------
usethis::use_data(glaas, overwrite = TRUE, compress = "xz")

# The CSV and XLSX files are too large for the repository (about 270 MB and
# 110 MB). They are attached to the release. To write them, name a folder
# outside the package in the environment variable GLAAS_EXPORT_DIR. The two
# load times are written as text in UTC, so no digit is lost.
export_dir <- Sys.getenv("GLAAS_EXPORT_DIR")
if (nzchar(export_dir)) {
  fs::dir_create(export_dir)
  export <- glaas |>
    dplyr::mutate(dplyr::across(
      c(sys_commit_date, sys_first_commit_date),
      \(x) format(x, "%Y-%m-%dT%H:%M:%OS3Z", tz = "UTC")
    ))
  readr::write_csv(export, fs::path(export_dir, "glaas.csv"))
  openxlsx::write.xlsx(export, fs::path(export_dir, "glaas.xlsx"))
}
