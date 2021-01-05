
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rbduk

<!-- badges: start -->

<!-- badges: end -->

The goal of Rbduk is to provide BDUK analysts with a centralised set of
repeatable functions for BDUK-specific R work.

## Installation

Ordinarily, a package would be installed either from a communal file
store, or from a git repository. As our VM’s do not connect to the T://
drive that we share, and packages cannot be installed from a Google
Source Repository, we have to do this manually:

1)  Within your VM, go to the ‘Files’ pane (next to ‘Plots’,‘Packages’,
    etc) and navigate to to the home directory by clicking the house
    symbol.\!
2)  Within the same pane, click the upload button.
3)  Select “Choose File”, navigate to the T:// drive, and select the
    file **Rbduk.tar.gz**. If you do not have access to the T:// drive,
    visit it is also stored on the [Data and Modelling team’s google
    drive](https://drive.google.com/drive/folders/1N760JFNMWoFAmhH3ivhkyrrYx882t2E5).
    Download the file to your computer from here, and upload in the same
    fashion.
4)  Within the console pane, enter
    `install.packages("dplyr","stringr","grid","ggplot2","bigrquery","geojsonsf","sf","shinyBS")`
    to install the packages dependencies.
5)  Open the terminal tab (next to the console tab) within Rstudio.
6)  Type `cd /home/dcms` and press enter.
7)  Type `R CMD INSTALL Rbduk.tar.gz` and press enter.

The package should now be installed, and to load it use `library(Rbduk)`
as you would any other package.

For any additional support, to contribute, or to suggest things you
would like to see, please contact
[sam.atkin@dcms.gov.uk](sam.atkin@dcms.gov.uk).

**Do not push any code into the repository unless it has been quality
assured first.**

## General functions

### is\_integer64()

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

### pretty\_postcode()

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

### is\_postcode()

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

### is\_uprn()

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

### %notin% and %\!in%

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

## GCP functions

### bduk\_bq()

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

## Spatial functions

### geojson\_to\_sf()

Data in BigQuery is frequently stored in geojson format. This function
provides a cimple shorthand to input a data frame or tibble that
contains a geojson column (eg. a table read from BigQuery) as easily
convert it to a simple feature. The inputs to this function are the data
frame or tibble, and the column name of the geojson column as a string.

``` r
bq_table<-bduk_bq(
          sql="SELECT * FROM dcms-datalake-staging.GEO_ONS.shp_LA LIMIT 1" ,
          project="dcms-datalake-staging",
          keypath="/home/dcms/keys")

geojson_to_sf(
        data=bq_table,
        geojson_colname = "geom"
      )
#> Simple feature collection with 1 feature and 10 fields
#> geometry type:  POLYGON
#> dimension:      XY
#> bbox:           xmin: 440052.7 ymin: 525456.8 xmax: 454455 ymax: 537152
#> CRS:            4326
#> Warning in st_is_longlat(x): bounding box has potentially an invalid value range
#> for longlat data
#> # A tibble: 1 x 11
#>                        geom OBJECTID LAD20CD LAD20NM LAD20NMW  BNG_E  BNG_N
#>               <POLYGON [°]>  <int64> <chr>   <chr>   <chr>    <int6> <int6>
#> 1 ((448973.6 536745.3, 448…        1 E06000… Hartle… <NA>     447160 531474
#> # … with 4 more variables: LONG <dbl>, LAT <dbl>, Shape__Are <dbl>,
#> #   Shape__Len <dbl>
```

### make\_sf()

This function provides an easy shorthand to take any dataframe with
coordinate columns, and convert it into a simple feature object. The
inputs to this function are the data frame or tibble, the x and y column
names, both as strings, and the coordinate system number. Coordinate
reference system codes can be found at <https://spatialreference.org/>.
This mostly serves as a wrapped to sf::st\_as\_sf(), but the defaults
for this are set as latitude and longitude. Columns containing the
string “lon” or “lat” in any case being used as the x\_colname and
y\_colname respectively, and the coordinate reference system set to
4326. If multiple columns contain these strings, the function will
return the data frame unchanged and produce an error message prompting
you to specify the column names manually.

``` r
make_sf(
       data=data.frame(
          "Longitude"=c(1,2,3),
          "Latitude"=c(51,52,53)
          ),
       x_colname="Longitude",
       y_colname="Latitude",
       crs=4326
    )
#> Simple feature collection with 3 features and 0 fields
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: 1 ymin: 51 xmax: 3 ymax: 53
#> CRS:            EPSG:4326
#>       geometry
#> 1 POINT (1 51)
#> 2 POINT (2 52)
#> 3 POINT (3 53)

make_sf(
       data=data.frame(
          "Longitude"=c(1,2,3),
          "Latitude"=c(51,52,53)
          )
    )
#> Simple feature collection with 3 features and 0 fields
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: 1 ymin: 51 xmax: 3 ymax: 53
#> CRS:            EPSG:4326
#>       geometry
#> 1 POINT (1 51)
#> 2 POINT (2 52)
#> 3 POINT (3 53)

make_sf(
      data=data.frame(
        "Longitude_1"=c(1,2,3),
        "Longitude_2"=c(11,12,14),
        "Latitude"=c(51,52,53)
      )
    )
#> Error: Multiple columns contain 'lon', please specify the x_colname.
#>   Longitude_1 Longitude_2 Latitude
#> 1           1          11       51
#> 2           2          12       52
#> 3           3          14       53
```

## Shiny functions

### clearGroups()

A function to clear all groups from a leaflet object from within a shiny
application. The prevents having to run `clearGroup("groupname")` for
every group. The input to this is the name of the map, and then the
groups wanting to be cleared as comma seperated strings.

    library(shiny)
    library(leaflet)
    library(dplyr)
    
    points_1<-data.frame("lng"=c(-2,-1,0),"lat"=c(51,52,53))
    points_2<-data.frame("lng"=c(-2.1,-1.1,-0.1),"lat"=c(51,52,53))
    
    ui<-fluidPage(
      fluidRow(
        actionButton("addgroups", "Add Groups"),
        actionButton("cleargroups", "Clear Groups"),
        leafletOutput("mymap")
      )
    )
    
    server<-function(input,output,session){
    
      output$mymap <- renderLeaflet({
        leaflet(options = leafletOptions(preferCanvas = TRUE)) %>%
          addTiles(options = tileOptions(opacity = 0.8), group = "Open Street Map") %>%
          setView(lng = -1, lat = 52, zoom = 7)
      })
    
      observeEvent(input$addgroups,{
        leafletProxy("mymap")%>%
          addCircles(data=points_1,lng=~lng,lat=~lat,color="Red",group="Group 1") %>%
          addCircles(data=points_2,lng=~lng,lat=~lat,color="Blue",group="Group 2")
      })
    
      observeEvent(input$cleargroups,{
        clearGroups(map="mymap","Group 1","Group 2")
      })
    }
    
    shinyApp(ui, server)

### radioTooltip()

By default, shiny and shinyBS together allow us to add popup tooltips to
shiny buttons and input fields. However, this tooltip will apply to all
parts of the input fiels. For radio buttons and groups of checkboxes,
this can be problematic. This function allows us to add a tooltip to
specific parts of a radio button.

    library(shiny)
    library(leaflet)
    library(dplyr)
    
    ui<-fluidPage(
      fluidRow(
        radioButtons(
          "radio",
          "Radio Button",
          choices=c("Tooltip shows on mouseover here",
                    "Tooltip shows on mouseover here as well",
                    "Tooltip does not show on mouseover here")
                    ),
        radioTooltip(
          id="radio",
          title="Tooltip message appears like this",
          choice=c(
            "Tooltip shows on mouseover here",
            "Tooltip shows on mouseover here as well"
          ),
          placement="right",
          trigger="hover"
        )
      )
    )
    
    server<-function(input,output,session){}
    
    shinyApp(ui, server)
