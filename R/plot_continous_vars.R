## -------------------------------------------------------------------

##' Plot Continous Variables
##'
##' Graphical summaries of numerical variables using functions from
##' \code{ggplot2} and \code{GGally}.
##' @param x Data frame which may include continous and discrete
##'     variables. Non-continous variables are ignored.
##' @param plot_type Plot type. Current options: \describe{
##'
##' \item{\code{"pairwise"}}{Calls \code{\link[GGally]{ggpairs}} to
##' get plots of pairwise differences. Avoid it if there are too many
##' numerical variables.}
##'
##' \item{\code{"density"}}{Calls \code{\link[ggplot2]{geom_density}}
##' and \code{\link[ggplot2]{geom_rug}}.}
##'
##' \item{\code{"histogram"}}{Calls
##' \code{\link[ggplot2]{geom_histogram}} and
##' \code{\link[ggplot2]{geom_rug}}.}
##'
##' \item{\code{"violin"}}{Calls \code{\link[ggplot2]{geom_violin}}
##' and \code{\link[ggplot2]{geom_jitter}}.}
##'
##' \item{\code{"boxplot"}}{Calls
##' \code{\link[ggplot2]{geom_boxplot}}.}
##' }
##' @return A ggplot object.
##' @importFrom dplyr select_if mutate
##' @importFrom tidyr gather
##' @importFrom GGally ggpairs
##' @importFrom ggplot2 ggplot geom_density geom_boxplot geom_violin
##'     geom_histogram facet_wrap coord_flip theme aes element_blank
##'     geom_rug geom_jitter theme_bw
##' @examples
##' library(GGally)
##'
##' plot_numerical_vars(iris, "pairwise")
##' plot_numerical_vars(iris, "density")
##' plot_numerical_vars(iris, "boxplot")
##' plot_numerical_vars(iris, "violin")
##' plot_numerical_vars(iris, "histogram")
##' @author Guillermo Basulto-Elias
##' @export
plot_numerical_vars <- function(x, plot_type) {

    ## Number of rows
    n <- nrow(x)

    ## Keep continous variables only
    x <- select_if(x, is.numeric)

    ## Set to NULL to pass test
    value <- NULL

    ## Get transparency for rug and jitter
    trans <- min(c(20/n, 1))

    if (plot_type == "pairwise") {
        out <- ggpairs(x)
    } else {
        x <- gather(x)
        if (plot_type == "density") {
            out <-
                x %>%
                ggplot(aes(value)) +
                geom_density(fill = "grey92") +
                facet_wrap(~key, scales = "free") +
                geom_rug(alpha = trans) +
                theme(axis.title.x = element_blank())
        } else if (plot_type == "histogram") {
            out <-
                x %>%
                ggplot(aes(value)) +
                geom_histogram() +
                facet_wrap(~key, scales = "free") +
                geom_rug(alpha = trans) +
                theme(axis.title.x = element_blank())
        } else if (plot_type == "violin") {
            out <-
                x  %>%
                mutate(x = "") %>%
                ggplot(aes(x, value)) +
                geom_violin() +
                facet_wrap(~key, scales = "free") +
                geom_jitter(alpha = trans) +
                coord_flip() +
                theme(axis.title.x = element_blank())
        } else if (plot_type == "boxplot") {
            out <-
                x %>%
                mutate(x = "") %>%
                ggplot(aes(x, value)) +
                geom_boxplot() +
                facet_wrap(~key, scales = "free") +
                coord_flip()
        } else {
            stop ("Plot type not defined.")
        }
    }
    out + theme_bw()
}



