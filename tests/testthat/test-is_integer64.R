test_that("Flags characters as false", {
  expect_equal(is_integer64("A"), FALSE)
})

test_that("Flags integers as false", {
  expect_equal(is_integer64(1), FALSE)
})

test_that("Flags decimals as false", {
  expect_equal(is_integer64(0.5), FALSE)
})

