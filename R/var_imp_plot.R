
## Function
## -------------------------------------------------------------------


##' Variable Importance Plot
##'
##' A 'ggplot2' version of \code{\link[randomForest]{varImpPlot}}
##' @param rf_object An object from
##'     \code{\link[randomForest]{randomForest}}.
##' @param n_vars Maximum number of variables to display in variable
##'     importance plot.
##' @param color Bar color in the plot.
##' @return A ggplot2 object.
##' @importFrom forcats fct_inorder
##' @importFrom randomForest randomForest
##' @importFrom ggplot2 geom_segment geom_point coord_flip theme_bw
##' @importFrom dplyr tibble arrange mutate n slice
##' @example
##' library(randomForest)
##' library(rmiscfun)
##' rf <- randomForest(Species ~ ., data = iris)
##' var_imp_plot(rf)
##'
##' @author Guillermo Basulto-Elias
##' @export
var_imp_plot <- function(rf_object, n_vars = 15, color = "brown3") {

    ## Set variables for data frame
    variable  <-  row.names(rf_object$importance)
    mean_decrease_gini  <-  rf_object$importance[, 1]

    ## Adjust the maximum number of variables to plot if necessary
    n_vars <- min(length(rf_object$importance), n_vars)

  ## Variable importance tibble
    importance_tibble <-
        tibble(variable, mean_decrease_gini) %>%
        arrange(mean_decrease_gini) %>%
        mutate(variable = fct_inorder(variable)) %>%
        slice(n() - 0:(n_vars - 1))

    ## Return plot
    importance_tibble %>%
        ggplot(aes(variable, mean_decrease_gini)) +
        ## geom_col(fill = color) +
        geom_segment(aes(xend = variable, yend = 0), color = color) +
        geom_point(color = color) +
        coord_flip() +
        theme_bw()
}

## Examples
## -------------------------------------------------------------------

## library(randomForest)
## library(forcats)
## library(ggplot2)

## rf <- randomForest(Species ~ ., data = iris)

## varImpPlot(rf)
## var_imp_plot(rf)
