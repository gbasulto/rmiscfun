##' Clean column content
##'
##' It cleans colum content (my relative definition of
##' 'clean'). Specifically, it separates with underscore (e.g.,
##' "pikaPika" to "pika_Pika"), replaces blank spaces with underscore,
##' replaces multiple symbols with single underscore, and removes
##' symbols after last word. These steps are followed IN THAT
##' ORDER. It acts in character and factor variables. It gives a
##' warning message if it is a factor. It does nothing to vectors
##' other than character and factors.
##'
##' It is basically the same as \code{\link{clean_colnames}}. The idea
##' is that they do slighly different things in the future. The
##' difference is that \code{\link{clean_colnames}} gives a warning
##' for repeated column names while \code{clean_col_content} gives
##' instead a warning if the column is a factor.
##' @importFrom stringr str_replace_all str_to_lower
##' @param x A factor of character vector.
##' @param warning_msg Logical. Turn on and off warning message for factors
##' @return A cleaner character of factor (same type as \code{x}).
##' @examples
##' clean_col_content(c("bart Simpson", "LisaSimpson",
##'                     "maggie..simpson!",
##'                     "MARGE-Simpson", "Homer Simpson :-)"))
##'
##' ## Get warning for factors.
##' \dontrun{
##' clean_col_content(
##'    factor(c("bart  Simpson", "LisaSimpson",
##'             "maggie..simpson!", "MARGE-Simpson",
##'             "bart  Simpson", "Homer Simpson :-)")))
##' }
##'
##' @author Guillermo Basulto-Elias
##' @export
clean_col_content <- function(x, warning_msg = TRUE) {

    ## Chack if x is a factor
    factor_flag <- is.factor(x)

    ## Cast as character if it's a factor.
    if (factor_flag) x <- as.character(x)

    ## Does nothing to non-character vectors.
    if (!is.character(x)) return (x)


    out <- x  %>%
        ## "pikaPika" to "pikaPika"
        str_replace_all("([a-z]+)([A-Z])", "\\1_\\2") %>%
        ## Replaces blank spaces by an underscore
        str_replace_all("[:blank:]+", "_") %>%
        ## Replace punctuation by underscore
        str_replace_all("[:punct:]+", "_") %>%
        ## Remove underscore at the end
        str_replace_all("_+$", "") %>%
        ## From upper to lower case
        str_to_lower()


    ## Send warning message if there are repeated column names
    if (factor_flag) {
        if (warning_msg) {
            warning(
                paste("Input variable is a factor.",
                      "It was cast to character,",
                      "then cast back to factor.")
            )
        }
        out <- factor(out)
    }

    out
}
