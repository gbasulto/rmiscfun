##' Add Missing Columns
##'
##' Appends to the dataframe \code{x} the columns not present in
##' \code{colnames}. Then, it fills them with \code{filler}.
##' @param x A dataframe with names.
##' @param colnames A vector of characters corresponding to the column
##'     names to be added to \code{x} if they are not already present.
##' @param filler A number or string to fill the new columns with,
##'     e.g., -999.99.
##' @return The dataframe \code{x} with extra columns.
##' @importFrom dplyr as_tibble bind_cols
##' @importFrom purrr set_names
##' @author Guillermo Basulto-Elias
##' @examples
##' library(rmiscfun)
##' input_df <- data.frame(a = 1:3, b = letters[1:3])
##' colnames_vector <- c("a", "b", "c")
##' add_missing_columns(input_df, colnames_vector, -888)
##' @export
add_missing_columns <- function(x, colnames, filler) {

    ## Input column names
    input_names <- names(x)

    ## Vector with missing columns from colnames.
    missing_cols <-
        colnames[!(colnames %in% input_names)]

    ## Check if there is at least one column not present
    if (length(missing_cols) == 0) return (x)

    extra_columns <-
        matrix(filler,
               nrow = nrow(x),
               ncol = length(missing_cols)) %>%
        as.data.frame() %>%
        as_tibble() %>%
        set_names(nm = missing_cols)

    bind_cols(x, extra_columns)
}

