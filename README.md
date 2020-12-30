
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
is_integer64(100)
#> [1] FALSE

is_integer64("x")
#> [1] FALSE
```

## pretty\_postcode()

This function takes a postcode in any format and any case, and converts
it into pretty format XX(X)(X)(Y)XXX, where X is the postcode, and Y is
the specified seperator, which is a space by default. The case can also
be specified, and is upper case by default.

``` r
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

The following demonstrates valid postcodes and invalid postcodes:

``` r
is_postcode("SW1a2nP")
#> [1] TRUE

is_postcode("SW1a 2nP")
#> [1] TRUE
```

``` r
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

## is\_uprn()

This function takes a numeric or character vector and returns TRUE or
FALSE depedent on whether it is in a valid UPRN format (all numeric,
between 1 and 12 characters). It will also flag as a message any UPRNs
that end 0000, as a common conversion error caused by scientific
notation and reading/writing from excel can cause genuine UPRNs to end
in a number of zeros, meaning they are no longer genuine. One or two of
these messages is acceptable, but many indicates that this error has
occured and that the UPRNs should be checked thoroughly.

The following demonstrates valid and invalid UPRNs:

``` r
is_uprn(1)
#> [1] TRUE

is_uprn(999999999999)
#> [1] TRUE

is_uprn("1")
#> [1] TRUE

is_uprn("999999999999")
#> [1] TRUE
```

``` r
is_uprn(9999999999999)
#> [1] FALSE

is_uprn("9999999999999")
#> [1] FALSE

is_uprn("")
#> [1] FALSE

is_uprn("ABC")
#> [1] FALSE

is_uprn("1,")
#> [1] FALSE

is_uprn(111.999)
#> [1] FALSE

is_uprn("111.999")
#> [1] FALSE

is_uprn("111-999")
#> [1] FALSE

is_uprn("111 999")
#> [1] FALSE
```
