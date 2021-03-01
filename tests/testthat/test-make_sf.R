test_that("Mirrors st_as_sf", {
  expect_equal(
    make_sf(
       data=data.frame(
          "Longitude"=c(1,2,3),
          "Latitude"=c(51,52,53)
          ),
       x_colname="Longitude",
       y_colname="Latitude",
       crs=4326
    ),
    sf::st_as_sf(
      data.frame(
        "Longitude"=c(1,2,3),
        "Latitude"=c(51,52,53)
      ),
      coords=c("Longitude","Latitude"),
      crs=4326
    )
  )
})

test_that("Defaults to lat and lon correctly", {
  expect_equal(
    make_sf(
      data=data.frame(
        "Longitude"=c(1,2,3),
        "Latitude"=c(51,52,53)
      )
    ),
    sf::st_as_sf(
      data.frame(
        "Longitude"=c(1,2,3),
        "Latitude"=c(51,52,53)
      ),
      coords=c("Longitude","Latitude"),
      crs=4326
    )
  )
})

test_that("Multiple 'lat' message occurs", {
  expect_message(
    make_sf(
      data=data.frame(
        "Longitude"=c(1,2,3),
        "Latitude_1"=c(51,52,53),
        "Latitude_2"=c(61,62,63)
      )
    ),
    "Error: Multiple columns contain 'lat', please specify the y_colname."
  )
})

test_that("Multiple 'lon' message occurs", {
  expect_message(
    make_sf(
      data=data.frame(
        "Longitude_1"=c(1,2,3),
        "Longitude_2"=c(11,12,14),
        "Latitude"=c(51,52,53)
      )
    ),
    "Error: Multiple columns contain 'lon', please specify the x_colname."
  )
})

test_that("Data is returned unchanged if columns not properly specified.", {
  expect_equal(
    make_sf(
      data=data.frame(
        "Longitude_1"=c(1,2,3),
        "Longitude_2"=c(11,12,14),
        "Latitude"=c(51,52,53)
      )
    ),
    data.frame(
      "Longitude_1"=c(1,2,3),
      "Longitude_2"=c(11,12,14),
      "Latitude"=c(51,52,53)
    )
  )
})


test_that("Wrong y_colname flags correctly.", {
  expect_message(
    make_sf(
      data=data.frame(
        "Longitude"=c(1,2,3),
        "Latitude"=c(51,52,53)
      ),
      x_colname="Longitude",
      y_colname="ycol_test",
      crs=4326
    ),
    "Error: 'ycol_test' is not present in the data."
  )
})

test_that("Wrong x_colname flags correctly.", {
  expect_message(
    make_sf(
      data=data.frame(
        "Longitude"=c(1,2,3),
        "Latitude"=c(51,52,53)
      ),
      x_colname="xcol_test",
      y_colname="Latitude",
      crs=4326
    ),
    "Error: 'xcol_test' is not present in the data."
  )
})
