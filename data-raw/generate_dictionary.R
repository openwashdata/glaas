get_limited_unique_values <- function(in_file, limit = NULL) {
  #' Reads a CSV file and returns a list of unique values from each column,
  #' optionally limited to a specified number.
  #'
  #' @param in_file (character) The path to the CSV file.
  #' @param limit (integer) Optional. The maximum number of unique values to return
  #'                      for each column. If NULL, all unique values are returned.
  #' @return (list) A list where each element contains the unique values from a
  #'                column of the data frame read from the CSV file. If 'limit'
  #'                is specified, each element will have at most 'limit' unique
  #'                values. Returns NULL if the file cannot be read.

  tryCatch({
    data_in <- readr::read_csv(in_file)
  }, error = function(e) {
    warning(paste("Could not read file:", in_file, "-", e$message))
    return(NULL)
  })

  if (is.null(data_in)) {
    return(NULL)
  }

  unique_list <- lapply(data_in, unique)

  if (!is.null(limit)) {
    limited_list <- lapply(unique_list, function(x) {
      if (length(x) > limit) {
        return(head(x, limit))
      } else {
        return(x)
      }
    })
    return(limited_list)
  } else {
    return(unique_list)
  }
}

# Example usage:
in_file <- here::here("inst/extdata", "glaas.csv")
limited_unique_values <- get_limited_unique_values(in_file, limit = 7)
print(limited_unique_values)