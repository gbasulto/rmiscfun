
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
</tbody>
</table>

Examples
--------

#### `glance_data`

``` r
## Load package
library(rmiscfun)

## Check documentation
help("glance_data")

## Summarize iris dataset
glance_data(iris)
```

#### `glance_data_in_worksheet`

``` r
## Load package
library(rmiscfun)

## Check documentation
help("glance_data_in_workbook")

## Summarize iris dataset
glance_data_in_workbook(iris)

## Uncomment the following line to summarize iris dataset AND create Excel Worksheet
## glance_data_in_worksheet(iris, "iris_in_excel.xlsx")
```
