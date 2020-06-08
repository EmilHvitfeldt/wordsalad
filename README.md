
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wordsalad

<!-- badges: start -->

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
#> # A tibble: 6,808 x 11
#>    tokens      V1     V2       V3    V4     V5      V6      V7     V8      V9
#>    <chr>    <dbl>  <dbl>    <dbl> <dbl>  <dbl>   <dbl>   <dbl>  <dbl>   <dbl>
#>  1 "\"Af… -0.0693 -0.353 -0.293   0.708  0.519  0.831  -0.198  0.595   0.298 
#>  2 "\"Aw…  0.413  -0.418 -0.336   1.32   0.480  0.795  -0.628  0.0266  0.639 
#>  3 "\"Aw…  0.802  -0.891 -1.32    0.737  0.868  0.488  -0.347  0.0240  0.0307
#>  4 "\"Bu…  0.368  -0.941 -0.0747  0.568  0.962  0.496  -1.37   1.31   -0.475 
#>  5 "\"By"  0.623   0.104  0.219   0.631  0.516 -0.105  -0.492  1.01    0.357 
#>  6 "\"Di…  0.764  -0.487 -0.00105 0.761  0.173  0.490  -0.588  0.723  -0.366 
#>  7 "\"Ea…  0.237  -0.893  0.265   1.16  -0.878  1.17   -0.651  0.428  -0.571 
#>  8 "\"Ev… -0.0431 -0.774 -0.898   1.31   0.517  0.215   0.0256 0.269   0.461 
#>  9 "\"Ge…  0.508  -0.585 -0.698   1.16   0.205 -0.304  -0.459  0.692   0.206 
#> 10 "\"Hu… -0.0798 -0.498 -0.493   1.22   0.762 -0.0990 -0.262  0.312   0.552 
#> # … with 6,798 more rows, and 1 more variable: V10 <dbl>
```

## Code of Conduct

Please note that the wordsalad project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
