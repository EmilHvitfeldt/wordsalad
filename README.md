
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

You can install the released version of wordsalad from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("wordsalad")
```

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
#>    tokens      V1     V2      V3     V4      V5      V6     V7       V8    V9
#>    <chr>    <dbl>  <dbl>   <dbl>  <dbl>   <dbl>   <dbl>  <dbl>    <dbl> <dbl>
#>  1 "\"Do" -0.662  -0.309  0.328  -0.223  0.0484  0.765  -0.556  7.64e-5 0.548
#>  2 "\"Go…  0.0439 -0.383 -0.226   0.715 -0.841   0.687  -0.492  3.86e-1 0.901
#>  3 "\"He"  0.0459 -0.269 -0.0117  0.214  0.0850 -0.149  -0.495 -8.79e-2 1.28 
#>  4 "\"He…  0.0389  0.168 -0.138   0.468  0.556  -0.365  -0.655 -2.17e-1 0.655
#>  5 "\"Oh" -0.239   0.221 -0.0658  0.968 -0.352   0.305  -0.235  1.95e-1 0.227
#>  6 "\"Th… -0.559  -0.269 -0.0896  0.987  0.601  -0.810  -0.398 -1.84e-1 1.08 
#>  7 "\"Ye… -0.446  -0.982 -0.549   0.534 -0.0989  1.03   -0.851 -3.12e-1 0.341
#>  8 "-"    -0.248  -0.323  0.0374  0.575  0.555   0.521  -0.472  2.65e-1 1.19 
#>  9 "All"   0.523  -0.456 -0.649   0.647  0.173   0.0621 -0.758 -6.09e-2 0.253
#> 10 "You"  -0.144   0.326  0.436   0.534  0.142   0.530  -0.226 -1.41e-1 1.53 
#> # … with 441 more rows, and 1 more variable: V10 <dbl>
```

## Code of Conduct

Please note that the wordsalad project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
