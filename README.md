
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wordsalad

<!-- badges: start -->

[![R build
status](https://github.com/EmilHvitfeldt/wordsalad/workflows/R-CMD-check/badge.svg)](https://github.com/EmilHvitfeldt/wordsalad/actions)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of wordsalad is to provide a unified interface for word
embedding methods to produce word vectors. wordsalad doesn’t provide the
implementation of these methods, only a unified interface. For more
information on the specific method please refer to the documentation.

Goals of this package are:

  - Allow the specification of tokenizer used
  - Streamline argument names and order
  - Consistent output formats
  - Avoid the need for creating temporary files

## Installation

If you want the development version instead then install directly from
GitHub:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/wordsalad")
```

## Example

``` r
library(wordsalad)

glove(fairy_tales)
#> # A tibble: 451 x 11
#>    tokens     V1     V2     V3      V4      V5      V6     V7      V8      V9
#>    <chr>   <dbl>  <dbl>  <dbl>   <dbl>   <dbl>   <dbl>  <dbl>   <dbl>   <dbl>
#>  1 "\"Do" -0.315 -0.699 -0.287  0.466   0.321   0.568   0.179 -0.0679 -1.00  
#>  2 "\"Go… -0.708 -0.983  0.464  0.589  -0.630   0.446  -1.03   0.447  -0.187 
#>  3 "\"He" -0.199 -0.592  0.259  0.157   0.224   0.456   0.127  0.177  -0.655 
#>  4 "\"He… -0.179 -0.690 -0.539  0.376  -0.367  -0.0658  0.378  0.302  -0.557 
#>  5 "\"Oh" -0.812 -0.327  0.640  1.11   -0.251   0.478  -0.229 -0.242  -0.538 
#>  6 "\"Th… -1.18   0.168 -0.246 -0.189   0.193   0.670   0.171 -0.0168 -0.585 
#>  7 "\"Ye… -0.245 -0.669  0.281  0.0824  0.343   0.977  -0.364  0.695  -0.768 
#>  8 "-"    -0.349 -0.412  0.701  0.501  -0.0532  0.704  -0.248  0.361  -0.757 
#>  9 "All"  -0.218 -0.669 -0.309  0.272  -0.122   0.277  -0.241 -0.0569  0.0158
#> 10 "You"  -0.843 -0.921  0.219  0.112   0.504   0.551   0.184  0.655  -0.958 
#> # … with 441 more rows, and 1 more variable: V10 <dbl>
```

## Code of Conduct

Please note that the wordsalad project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
