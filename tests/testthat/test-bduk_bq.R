sql<-"SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 "
keypath<-NULL
key<-NULL
project<-"dcms-datalake-staging"

keypath<-"~/keys/"


test_that("Query with no key or keypath specified", {
  setwd("/home/dcms/keys")
  expect_equal(
    bduk_bq(
      sql="SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 ",
      project="dcms-datalake-staging"
      ),
    dplyr::tibble(pcds="pcds",Rurality="Rurality")
  )
})

test_that("Query key specified", {
  setwd("/home/dcms/keys")
  expect_equal(
    bduk_bq(
      sql="SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 ",
      project="dcms-datalake-staging",
      key="dcms-datalake-staging_bigquery.json"
    ),
    dplyr::tibble(pcds="pcds",Rurality="Rurality")
  )
})

test_that("Query with keypath specified", {
  setwd("/home")
  expect_equal(
    bduk_bq(
      sql="SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 ",
      project="dcms-datalake-staging",
      keypath="/home/dcms/keys"
    ),
    dplyr::tibble(pcds="pcds",Rurality="Rurality")
  )
})

test_that("Missing key message occurs", {
  setwd("/home")
  expect_message(
    bduk_bq(
      sql="SELECT pcds,Rurality FROM `dcms-datalake-staging.GEO_ONS.ONS_RURALITY` LIMIT 1 ",
      project="dcms-datalake-staging",
    ),
    "There is no json key saved in this directory. Please copy the file 'dcms-datalake-staging_bigquery.json' into the project or directory you are working within. The file can likely be found in ~/home/keys. If you have not made this folder, please contact the BDUK data and modelling team for additional support."
  )
})

