# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
library(usethis)
library(fs)
library(here)
library(readr) # !
library(openxlsx) # !
library(dplyr)

# Read data --------------------------------------------------------------------
in_file <- "glaas.csv"
data_in <- readr::read_csv(here::here("data-raw", in_file))
in_file_root <- strsplit(in_file, "\\.")[[1]][1]

# Tidy data --------------------------------------------------------------------
data_out_coarse <- data_in |> 
    select(-(Lang:ParentLocTypeText)) |> 
    select(-starts_with("Sys")) |> 
    select(-starts_with("Com")) |> 
    select(-contains("Seq")) |> 
    select(-(UoM:X_RecordID))

data_out_medium <- data_out_coarse |> 
    select(-(FID:GrandParent)) |> 
    select(-(Parent)) |> 
    select(-(LocType:Loc)) |> 
    select(-(TimeType:TimeTypeText)) |> 
    select(-(DataYear:IsComparable)) |> 
    select(-(IsLatest)) |> 
    select(-(starts_with("Dim") & ends_with("Type"))) |> 
    select(-(starts_with("Dim") & ends_with("Val"))) |> 
    select(-(ValCodeNum:ValAmount))

data_out_fine <- data_out_medium |> 
    select(-(Ind:IndText)) |> 
    select(-(starts_with("Dim") & ends_with("TypeText")))

data_out <- data_out_fine

unique_values_list <- data_out |> 
    lapply(unique)
options(max.print=70)
unique_values_list

excluded_cols <- setdiff(names(data_in), names(data_out))
cat("Excluded columns:\n", paste(excluded_cols, collapse = ", "))

# Export Data ------------------------------------------------------------------
usethis::use_data(data_out, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(data_out,
                 here::here("inst", "extdata", paste0(in_file_root, ".csv")))
