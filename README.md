
<!-- README.md is generated from README.Rmd. Please edit that file -->
rmiscfun
========

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/gbasulto/rmiscfun.svg?branch=master)](https://travis-ci.org/gbasulto/rmiscfun) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/gbasulto/rmiscfun?branch=master&svg=true)](https://ci.appveyor.com/project/gbasulto/rmiscfun) [![Codecov test coverage](https://codecov.io/gh/gbasulto/rmiscfun/branch/master/graph/badge.svg)](https://codecov.io/gh/gbasulto/rmiscfun?branch=master) <!-- badges: end -->

The goal of rmiscfun is provide call functions that I use in different projects (at work and personal ones.)

Prerrequisites
--------------

1.  Install [Rtools](https://cran.r-project.org/bin/windows/Rtools/) (Only if you are on Windows): Download and execute the recommended EXE file in [this link](https://cran.r-project.org/bin/windows/Rtools/).
2.  Install `devtools` package in `R`:

``` r
install.packages("devtools")
```

Installation
------------

You can install the current version of rmiscfun from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gbasulto/rmiscfun")
```

Available Functions
-------------------

-   `glance_data`: Summarize both, categorical and numerical variables in a dataframe.

This is an example:

``` r
## Load package
library(rmiscfun)

## Check documentation
help("glance_data")

## Summarize iris dataset
glance_data(iris)
```

-   `glance_data_in_worksheet`: Similar to `glance_data`, but it breaks the summary into types and allows the used to save it in an Excel Worksheet.

This is an example:

``` r
## Load package
library(rmiscfun)

## Check documentation
help("glance_data_in_worksheet")

## Summarize iris dataset
glance_data_in_worksheet(iris)

## Uncomment the following line to summarize iris dataset AND create Excel Worksheet
## glance_data_in_worksheet(iris, "iris_in_excel.xlsx")
```
