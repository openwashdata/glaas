if(!requireNamespace("httr", quietly = TRUE)){install.packages("httr")}
if(!requireNamespace("glue", quietly = TRUE)){install.packages("glue")}

build_odata_url <- function(base_url, select = NULL, filter = NULL, skip = NULL, top = NULL) {
  #' Build an OData URL with specified select, filtering, skip, and top options.
  #'
  #' @param base_url (character) The base URL of the OData API endpoint.
  #' @param select (character) A character vector of column names to select.
  #'                 e.g., c('COL1', 'COL2', 'COL3').
  #' @param filter (list) A named list of filter conditions. The name of the list element is the field,
  #'                 and the value is a character vector of values for 'in' filtering.
  #'                 e.g., list(CODE_ISO_3 = c('ZWE', 'VIR', 'LBN'), DataYear = 2022).
  #' @param skip (integer) The number of records to skip.
  #' @param top (integer) The maximum number of records to return.
  #' @return (character) The constructed OData URL.

  parsed_url <- httr::parse_url(base_url)
  query_list <- parsed_url$query

  # Ensure $format=csv is present
  query_list[['$format']] <- 'csv'

  if (!is.null(select)) {
    query_list[['$select']] <- paste(select, collapse = ",")
  }

  if (!is.null(filter)) {
    filter_expressions <- character(0)
    for (field in names(filter)) {
      values <- filter[[field]]
      quoted_values <- paste0("'", values, "'", collapse = ",")
      filter_expression <- glue::glue("{field} in ({quoted_values})")
      filter_expressions <- c(filter_expressions, filter_expression)
    }
    if (length(filter_expressions) > 0) {
      query_list[['$filter']] <- paste(filter_expressions, collapse = " and ")
    }
  }

  if (!is.null(skip)) {
    query_list[['$skip']] <- skip
  }

  if (!is.null(top)) {
    query_list[['$top']] <- top
  }
  parsed_url$query <- query_list
  full_url <- httr::build_url(parsed_url)
  return(full_url)
}

fetch_odata <- function(base_url, filter = NULL, skip = NULL, top = NULL, out_file) {
  #' Fetch data from an OData API URL with specified filtering, skip, and top options, and save to a local file.
  #'
  #' @param base_url (character) The base URL of the OData API endpoint.
  #' @param filter (list) A named list of filter conditions. The name of the list element is the field,
  #'                 and the value is a character vector of values for 'in' filtering.
  #'                 e.g., list(CODE_ISO_3 = c('ZWE', 'VIR', 'LBN'), DataYear = 2022).
  #' @param skip (integer) The number of records to skip.
  #' @param top (integer) The maximum number of records to return.
  #' @param out_file (character) The path to the local file for saving.
  #' @return (logical) TRUE if successful, FALSE otherwise (invisibly).

  tryCatch({
    odata_url <- build_odata_url(base_url, filter = filter, skip = skip, top = top)

    response <- httr::GET(odata_url)
    httr::stop_for_status(response)

    content_type <- httr::headers(response)[['Content-Type']]

    if (!is.null(content_type) && grepl('text/csv', content_type, ignore.case = TRUE)) {
      data <- httr::content(response, as = "text", encoding = "UTF-8")
      df <- utils::read.csv(text = data, stringsAsFactors = FALSE)
      utils::write.csv(df, file = out_file, row.names = FALSE)
      file_size_mb <- file.info(out_file)$size / 1e6
      message(sprintf("Data saved to '%s'", out_file))
      message(sprintf("File size: %.2f MB", file_size_mb))
      invisible(TRUE)
    } else {
      warning(sprintf("Received unexpected Content-Type: %s", content_type %||% "NULL"))
      message("Response content:")
      message(content(response, as = "text", encoding = "UTF-8"))
      invisible(FALSE)
    }
  }, error = function(e) {
    stop(sprintf("Error fetching data from %s: %s", odata_url, e$message))
  })
}
