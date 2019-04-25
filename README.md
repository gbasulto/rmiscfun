
<!-- README.md is generated from README.Rmd. Please edit that file -->
rmiscfun
========

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/gbasulto/rmiscfun.svg?branch=master)](https://travis-ci.org/gbasulto/rmiscfun) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/gbasulto/rmiscfun?branch=master&svg=true)](https://ci.appveyor.com/project/gbasulto/rmiscfun) [![Codecov test coverage](https://codecov.io/gh/gbasulto/rmiscfun/branch/master/graph/badge.svg)](https://codecov.io/gh/gbasulto/rmiscfun?branch=master) <!-- badges: end -->

The goal of rmiscfun is provide call functions that I use in different projects (at work and personal ones.)

Prerequisites
-------------

1.  Install [Rtools](https://cran.r-project.org/bin/windows/Rtools/) (Only if you are on Windows): Download and execute the recommended EXE file in [this link](https://cran.r-project.org/bin/windows/Rtools/).
2.  Install `devtools` package in `R`:

    ``` r
    install.packages("devtools")
    ```

3.  Install `tidyverse` package in `R`. I use functions from several tidyverse packages, so it is better to have them all installed.

    ``` r
    install.packages("tidyverse")
    ```

Installation
------------

You can install the current version of rmiscfun from [GitHub](https://github.com/) with:

``` r
devtools::install_github("gbasulto/rmiscfun")
```

Available Functions
-------------------

<table>
<colgroup>
<col width="26%" />
<col width="73%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Function</th>
<th align="left">Brief description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><code>glance_data</code></td>
<td align="left">Summarize both, categorical and numerical variables in a dataframe</td>
</tr>
<tr class="even">
<td align="left"><code>glance_data_in_workbook</code></td>
<td align="left">Similar to <code>glance_data</code>, but it breaks the summary into types and allows the used to save it in an Excel Workbook</td>
</tr>
<tr class="odd">
<td align="left"><code>plot_numerical_vars</code></td>
<td align="left">Graphical summaries of numerical variables using functions from <code>ggplot2</code> and <code>GGally</code></td>
</tr>
<tr class="even">
<td align="left"><code>clean_colnames</code></td>
<td align="left">Clean column names</td>
</tr>
<tr class="odd">
<td align="left"><code>clean_col_content</code></td>
<td align="left">Clean column content if a variable is character or factor</td>
</tr>
</tbody>
</table>

Examples
--------

I am using the Iris dataset in R, which has 5 variables. The first four are measurements 150 flores and the last column specifies the species (there are 50 flowers of each species).

``` r
## Uncomment the following line to read the documentation of the dataset.
## help(iris)

head(iris)
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1          5.1         3.5          1.4         0.2  setosa
#> 2          4.9         3.0          1.4         0.2  setosa
#> 3          4.7         3.2          1.3         0.2  setosa
#> 4          4.6         3.1          1.5         0.2  setosa
#> 5          5.0         3.6          1.4         0.2  setosa
#> 6          5.4         3.9          1.7         0.4  setosa
```

#### `glance_data`

``` r
## Load package
library(rmiscfun)

## Check documentation
help("glance_data")

## Summarize iris dataset
glance_data(iris)
```

#### `glance_data_in_workbook`

``` r
## Load package
library(rmiscfun)

## Check documentation
help("glance_data_in_workbook")

## Summarize iris dataset
glance_data_in_workbook(iris)

## Uncomment the following line to summarize iris dataset AND create Excel Worksheet
## glance_data_in_workbook(iris, "iris_in_excel.xlsx")
```

#### `plot_numerical_vars`

``` r
## Load package
library(rmiscfun)

## Check documentation
help("plot_numerical_vars")

plot_numerical_vars(iris, "pairwise")
plot_numerical_vars(iris, "density")
plot_numerical_vars(iris, "boxplot")
plot_numerical_vars(iris, "violin")
plot_numerical_vars(iris, "histogram")
plot_numerical_vars(iris, "qqplot")
```

#### `clean_colnames`

``` r
## Load package
library(rmiscfun)

## Check documentation
help("clean_colnames")

input <- c("bart Simpson", "LisaSimpson", "maggie..simpson!",
                 "MARGE-Simpson", "Homer Simpson :-)")
clean_colnames(input)
```

#### `clean_col_content`

``` r
library(rmiscfun)

clean_col_content(c("bart Simpson", "LisaSimpson",
                    "maggie..simpson!",
                    "MARGE-Simpson", "Homer Simpson :-)"))

## Get warning for factors.
clean_col_content(
  factor(c("bart  Simpson", "LisaSimpson",
           "maggie..simpson!", "MARGE-Simpson",
           "bart  Simpson", "Homer Simpson :-)"))
)
```
