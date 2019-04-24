
print_duplicated_columns <- function(x) {
  tab <- table(x)
  out <- names(tab[tab > 1])
  out <- paste(out, collapse = ", ")
  out
}

##' Clean column names
##'
##' It cleans column names (my relative definition of
##' 'clean'). Specifically, it separates with underscore (e.g.,
##' "pikaPika" to "pika_pika"), replaces blank spaces with underscore,
##' replaces multiple symbols with single underscore, and removes
##' symbols after last word. These steps are followed IN THAT ORDER.
##' @importFrom stringr str_replace_all str_to_lower
##' @param column_names A vector with column names
##' @return A vector with clean names
##' @examples
##' clean_colnames(c("bart Simpson", "LisaSimpson", "maggie..simpson!",
##'                  "MARGE-Simpson", "Homer Simpson :-)"))
##'
##' ## Get warning if there are repeated colum names
##' \dontrun{
##' clean_colnames(c("bart  Simpson", "LisaSimpson",
##'                  "maggie..simpson!", "MARGE-Simpson", "bart-Simpson",
##'                  "Homer Simpson :-)"))
##' }
##'
##' @author Guillermo Basulto-Elias
##' @export
clean_colnames <- function(column_names) {
  out <- column_names  %>%
    str_replace_all("([a-z]+)([A-Z])", "\\1_\\2") %>%
    str_replace_all("[:blank:]+", "_") %>%
    str_replace_all("[:punct:]+", "_") %>%
    str_replace_all("_+$", "") %>%
    str_to_lower()

  ## Compute number of unique names
  length1 <- length(unique(column_names))
  length2 <- length(unique(out))

  ## Send warning message if there are repeated column names
  if (length1 != length2) {
    warning(
      paste("The following column names are duplicated :",
            print_duplicated_columns(out))
    )
  }

  out
}


