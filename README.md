
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rbduk

<!-- badges: start -->

<!-- badges: end -->

The goal of Rbduk is to provide BDUK analysts with a centralised set of
repeatable functions for BDUK-specific R work.

## Installation

You can install the released version of Rbduk from
[sam.atkin@dcms.gov.uk](sam.atkin@dcms.gov.uk) with:

``` r
devtools::install.github("NAME/Rbduk")
```

## Example

TODO- List all functions and add worked examples

``` r
library(Rbduk)

is_integer64(100)
#> [1] FALSE

is_integer64("x")
#> [1] FALSE

pretty_postcode("SW1a2nP")
#> [1] "SW1A 2NP"
```
