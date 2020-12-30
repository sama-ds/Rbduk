
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

## is\_integer64()

Within GCP, large numbers (eg UPRNs) are stored are 64-bit integers. R,
on the whole, does not like 64-bit integer, and whilst it can cope, it’s
easier to read in these columns are numeric, or convert them to numeric
within R. To see if an object is currently a 64-bit integer, this
function can be used.

``` r
library(Rbduk)

is_integer64(100)
#> [1] FALSE

is_integer64("x")
#> [1] FALSE
```

## pretty\_postcode()

This function allows us to enter a postcode in any format and any case,
and convert it into pretty format XX(X)(X)(Y)XXX, where X is the
postcode, and Y is the specified seperator, which is a space by default.
The case can also be specified, and is upper case by default.

``` r
library(Rbduk)

pretty_postcode("SW1a2nP")
#> [1] "SW1A 2NP"

pretty_postcode("SW1a2nP", sep="")
#> [1] "SW1A2NP"

pretty_postcode("SW1a2nP", sep=".")
#> [1] "SW1A.2NP"

pretty_postcode("SW1a2nP", sep=".", uppercase=FALSE)
#> [1] "sw1a.2np"
```

## is\_postcode()

This function takes a string and returns TRUE or FALSE depedent on
whether the string is in a valid UK postcode format or not. This may
contain one space and still be valid. This does not indicate whether a
postcode is an existing postcode, but that is has the format of one.

``` r
library(Rbduk)

is_postcode("SW1a2nP")
#> [1] TRUE

is_postcode("SW1a 2nP")
#> [1] TRUE

is_postcode("S 2NP")
#> [1] FALSE

is_postcode("Sw1a.2np")
#> [1] FALSE

is_postcode("Sw1a2npX")
#> [1] FALSE

is_postcode("Sw1a  2np")
#> [1] FALSE

is_postcode("000000")
#> [1] FALSE

is_postcode("XXXXXX")
#> [1] FALSE
```
