
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
#> starting httpd help server ... done

## Summarize iris dataset
glance_data(iris)
#> # A tibble: 5 x 9
#>   name  type  distinct_values minimum median maximum na_proportion count
#>   <chr> <chr>           <int>   <dbl>  <dbl>   <dbl>         <dbl> <chr>
#> 1 Sepa~ nume~              35     4.3   5.8      7.9             0 Too ~
#> 2 Sepa~ nume~              23     2     3        4.4             0 Too ~
#> 3 Peta~ nume~              43     1     4.35     6.9             0 Too ~
#> 4 Peta~ nume~              22     0.1   1.3      2.5             0 Too ~
#> 5 Spec~ fact~               3    NA    NA       NA               0 seto~
#> # ... with 1 more variable: sample_values <chr>
```
