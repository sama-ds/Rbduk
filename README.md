
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rbduk

<!-- badges: start -->

<!-- badges: end -->

The goal of Rbduk is to provide BDUK analysts with a centralised set of
repeatable functions for BDUK-specific R work.

## Installation

You can install the released version of Rbduk by pulling this repository
onto your machine, opening the project, and running:

``` r
devtools::install()
```

For any additional support, to contribute, or to suggest things you
would like to see, please contact
[sam.atkin@dcms.gov.uk](sam.atkin@dcms.gov.uk).

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
#Too short
is_postcode("S 2NP")
#> [1] FALSE

#Contains punctuation
is_postcode("Sw1a.2np")
#> [1] FALSE

#Too long
is_postcode("Sw1a2npX")
#> [1] FALSE

#Contains too many spaces
is_postcode("Sw1a  2np")
#> [1] FALSE

#Not valid number/letter combiantion
is_postcode("000000")
#> [1] FALSE

#Not valid number/letter combiantion
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
#Too long
is_uprn(9999999999999)
#> [1] FALSE

#Too long
is_uprn("9999999999999")
#> [1] FALSE

#Empty
is_uprn("")
#> [1] FALSE

#Letters
is_uprn("ABC")
#> [1] FALSE

#Contains trailing characters
is_uprn("1,")
#> [1] FALSE

#Not an integer
is_uprn(111.999)
#> [1] FALSE

#Not an integer
is_uprn("111.999")
#> [1] FALSE

#Contains punctuation
is_uprn("111-999")
#> [1] FALSE

#Contains punctuation
is_uprn("111 999")
#> [1] FALSE
```

## %notin% and %\!in%

These functions serve the same purpose, and that is to give a more
readable version of the opposite of `%in%`. They output the opposite
logical response that `%in%` would provide.

``` r

2 %!in% c(1,3)
#> [1] TRUE

2 %notin% c(1,3)
#> [1] TRUE

"b" %!in% c("a","c")
#> [1] TRUE

"b" %notin% c("a","c")
#> [1] TRUE
```

``` r

2 %!in% c(1,2,3)
#> [1] FALSE

2 %notin% c(1,2,3)
#> [1] FALSE

"b" %!in% c("a","b","c")
#> [1] FALSE

"b" %notin% c("a","b","c")
#> [1] FALSE
```

``` r

all.equal(2 %!in% c(1,3), 2 %notin% c(1,3), !2 %in% c(1,3))
#> [1] TRUE

all.equal("b" %!in% c("a","c"), "b" %notin% c("a","c"), !"b" %!in% c("a","c"))
#> [1] TRUE
```

## bduk\_bq()

THis function provides a shorthand for writing queries directly to
bigquery within R. The input to this function must be a valid query, and
the name of the project you are quering from within GCP. To run such a
query a .json billing key must be stored on your machine. By default,
this function will assume the key is the project name with
"\_bigquery.json" at the end. If this is not the case, the key name will
need to be specified. By default, this function will assume the key is
stored in the current working directory or project. If this is not the
case, the key must be specified. This function also sets ‘bigint’ to
integer64, allowing R to load in integer64 numbers (eg. UPRNs), but it
is recommended that you use ‘CAST(VARIABLE as NUMERIC) as VARIABLE’ when
running your queries, or converting these to numeric once they have been
read
in.

``` r
sql="SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 "

setwd("/home/dcms/keys")

bduk_bq(
      sql=sql,
      project="dcms-datalake-staging"
    )
#> # A tibble: 1 x 2
#>   pcds  Rurality
#>   <chr> <chr>   
#> 1 pcds  Rurality

bduk_bq(
      sql=sql,
      project="dcms-datalake-staging",
      key="dcms-datalake-staging_bigquery.json"
    )
#> # A tibble: 1 x 2
#>   pcds  Rurality
#>   <chr> <chr>   
#> 1 pcds  Rurality

bduk_bq(
      sql=sql,
      project="dcms-datalake-staging",
      keypath="/home/dcms/keys"
    )
#> # A tibble: 1 x 2
#>   pcds  Rurality
#>   <chr> <chr>   
#> 1 pcds  Rurality
```

``` r
sql="SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 "

#No key in this directory
setwd("/home/dcms/")

bduk_bq(
      sql=sql,
      project="dcms-datalake-staging"
    )
#> There is no json key saved in this directory. Please copy the file 'dcms-datalake-staging_bigquery.json' into the project or directory you are working within. The file can likely be found in ~/home/keys. If you have not made this folder, please contact the BDUK data and modelling team for additional support.
```
