
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
  - Consistent output formats
  - Avoid need for creating of temporary files

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
#>    tokens      V1      V2      V3      V4      V5      V6      V7       V8
#>    <chr>    <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>    <dbl>
#>  1 "\"Do" -0.0285 -0.563   0.638  -0.631  -0.289  -0.229   0.983  -0.00720
#>  2 "\"Go… -0.369  -0.857   0.0477 -0.263   0.0787  0.271   0.375  -0.499  
#>  3 "\"He" -0.763  -0.470  -0.698  -0.526   0.518   0.349  -0.0852 -1.01   
#>  4 "\"He… -0.192  -0.0354 -0.260  -1.17    0.652  -0.0418 -0.0485 -0.766  
#>  5 "\"Oh" -0.308  -0.879   0.262  -0.796   0.538   0.513   0.393  -0.184  
#>  6 "\"Th… -0.393  -0.0678 -0.565  -0.369   0.683   0.386   0.0559 -1.39   
#>  7 "\"Ye… -0.278  -0.423  -0.0846 -0.667   0.872   0.993   0.312  -0.461  
#>  8 "-"    -1.01   -0.849  -0.234  -0.0341 -0.0836  0.619   0.0295 -0.126  
#>  9 "All"   0.457   0.0562  0.498  -0.0132 -0.500   0.418   0.418  -0.462  
#> 10 "You"  -1.24   -0.549  -0.755  -0.938  -0.261   0.853  -0.370  -0.604  
#> # … with 441 more rows, and 2 more variables: V9 <dbl>, V10 <dbl>
```

## Code of Conduct

Please note that the wordsalad project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
