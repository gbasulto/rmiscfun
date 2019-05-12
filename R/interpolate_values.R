
## -------------------------------------------------------------------

##' Interpolate Values
##'
##' Obtain the values of a variable of interest corresponding to a
##' continuous variable (\code{t_out}) using
##' @param t_out A numeric vector of size n.
##' @param t_in A numeric vector of size m.
##' @param values_in A character or numeric vector of size m.
##' @param direction A string equal to \code{"down"} or \code{"up"}.
##' @return A vector of size n.
##' @author Guillermo Basulto Elias
##' @importFrom tibble tibble
##' @importFrom tidyr fill
##' @importFrom dplyr full_join arrange left_join
##' @export
interpolate_values <- function(t_out,
                               t_in,
                               values_in,
                               direction = "down"){
    x <- NULL
    y <- NULL

    ## Dummy dataframe
    df0 <- tibble(x = t_out, idx = seq_along(t_out))

    ## Tibble with three columns (wit artificial index column)
    df1 <- tibble(x = t_in, y = values_in)

    ## Tibble with one column
    df2 <- tibble(x = t_out)

    ## Combine dataframes filling (the second column has many NAs)
    df <- full_join(df1, df2, by = "x")

    ## Arrange
    df <- arrange(df, x)

    ## Fill dataframes
    df <- fill(df, y, .direction = direction)

    ## Return a vector
    out <- left_join(df0, df, by = "x")$y

    return (out)
}


