test_that("Base functionality", {
  expect_true(
    !is.null(
      geojson_to_sf(
        data=Rbduk::bduk_bq(
          sql="SELECT * FROM dcms-datalake-staging.GEO_ONS.shp_LA LIMIT 1" ,
          project="dcms-datalake-staging",
          keypath="/home/dcms/keys"),
        geojson_colname = "geom"
      )
    )
  )
})

