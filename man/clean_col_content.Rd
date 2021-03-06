% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_col_content.R
\name{clean_col_content}
\alias{clean_col_content}
\title{Clean column content}
\usage{
clean_col_content(x, warning_msg = TRUE)
}
\arguments{
\item{x}{A factor of character vector.}

\item{warning_msg}{Logical. Turn on and off warning message for factors}
}
\value{
A cleaner character of factor (same type as \code{x}).
}
\description{
It cleans column content (my relative definition of
'clean'). Specifically, it separates with underscore (e.g.,
"pikaPika" to "pika_Pika"), replaces blank spaces with underscore,
replaces multiple symbols with single underscore, and removes
symbols after last word. These steps are followed IN THAT
ORDER. It acts in character and factor variables. It gives a
warning message if it is a factor. It does nothing to vectors
other than character and factors.
}
\details{
It is basically the same as \code{\link{clean_colnames}}. The idea
is that they do slightly different things in the future. The
difference is that \code{\link{clean_colnames}} gives a warning
for repeated column names while \code{clean_col_content} gives
instead a warning if the column is a factor.
}
\examples{
clean_col_content(c("bart Simpson", "LisaSimpson",
                    "maggie..simpson!",
                    "MARGE-Simpson", "Homer Simpson :-)"))

## Get warning for factors.
\dontrun{
clean_col_content(
   factor(c("bart  Simpson", "LisaSimpson",
            "maggie..simpson!", "MARGE-Simpson",
            "bart  Simpson", "Homer Simpson :-)")))
}

}
\author{
Guillermo Basulto-Elias
}
