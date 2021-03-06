% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interpolate_values.R
\name{interpolate_values}
\alias{interpolate_values}
\title{Interpolate Values}
\usage{
interpolate_values(t_out, t_in, values_in, direction = "down")
}
\arguments{
\item{t_out}{A numeric vector of size n.}

\item{t_in}{A numeric vector of size m.}

\item{values_in}{A character or numeric vector of size m.}

\item{direction}{A string equal to \code{"down"} or \code{"up"}.}
}
\value{
A vector of size n.
}
\description{
Obtain the values of a variable of interest corresponding to a
continuous variable (\code{t_out}) using
}
\examples{
 x <- c(1, 2, 4, 5)
 y <- c(1, 3, 7)
 z <- c("a", "b", "a")
 interpolate_values(x, y, z)
}
\author{
Guillermo Basulto Elias
}
