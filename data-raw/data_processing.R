# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
## Comment the following code in console if you do have the packages
install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx"))

library(usethis)
library(fs)
library(here)
library(readr)
library(readxl)
library(openxlsx)

# Read data --------------------------------------------------------------------
# data_in <- readr::read_csv("data-raw/dataset.csv")
# codebook <- readxl::read_excel("data-raw/codebook.xlsx") |>
#  clean_names()


# Tidy data --------------------------------------------------------------------
## Clean the raw data into a tidy format here


# Export Data ------------------------------------------------------------------
usethis::use_data(glaas, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(glaas,
                 here::here("inst", "extdata", paste0("glaas", ".csv")))
openxlsx::write.xlsx(glaas,
                     here::here("inst", "extdata", paste0("glaas", ".xlsx")))
