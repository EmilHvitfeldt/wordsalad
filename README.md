
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wordsalad

<!-- badges: start -->

[![R build
status](https://github.com/EmilHvitfeldt/wordsalad/workflows/R-CMD-check/badge.svg)](https://github.com/EmilHvitfeldt/wordsalad/actions)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of wordsalad is to provide a unified interface for word
embedding methods to produce word vectors.

Goals of this package are:

  - Allow the specification of tokenizer used
  - Streamline argument names and order
  - Consistant output formats

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
#>    tokens       V1      V2     V3     V4      V5    V6     V7     V8     V9
#>    <chr>     <dbl>   <dbl>  <dbl>  <dbl>   <dbl> <dbl>  <dbl>  <dbl>  <dbl>
#>  1 "\"Do" -0.0137   0.974   1.21   0.805  0.254  0.822  0.907  0.243 -0.193
#>  2 "\"Go…  0.00368  0.482  -0.600 -1.21   0.517  0.347  0.312  0.361 -0.712
#>  3 "\"He"  0.0800  -0.339  -0.384 -0.870 -0.472  0.355  0.185 -0.224 -1.13 
#>  4 "\"He… -0.359   -0.400  -0.450 -0.503  0.266  0.464  0.179  0.145 -0.575
#>  5 "\"Oh"  0.778    0.0130  0.407 -0.516  0.0855 0.361 -0.293 -0.549 -0.617
#>  6 "\"Th… -0.0854   0.451  -0.461 -0.538  0.229  0.592  0.543 -0.145 -0.868
#>  7 "\"Ye… -0.570    0.883  -0.115 -0.288 -0.705  0.431  0.468 -0.277 -0.696
#>  8 "-"    -0.607    0.440   0.100 -0.630 -0.0968 0.787  1.07  -0.500 -0.927
#>  9 "All"   0.373   -0.297   0.183 -0.447  0.183  1.07   0.843  0.257  0.512
#> 10 "You"  -0.723    0.241  -0.127 -0.616  0.391  0.430  0.268 -0.602 -0.753
#> # … with 441 more rows, and 1 more variable: V10 <dbl>
```

## Code of Conduct

Please note that the wordsalad project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
