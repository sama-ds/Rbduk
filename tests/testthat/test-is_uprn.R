test_that("One number works", {
  expect_equal(is_uprn(1), TRUE)
})

test_that("Twelve numbers work", {
  expect_equal(is_uprn(999999999999), TRUE)
})

test_that("One character works", {
  expect_equal(is_uprn("1"), TRUE)
})

test_that("Twelve characters work", {
  expect_equal(is_uprn("999999999999"), TRUE)
})

test_that("Empty strings return flase", {
  expect_equal(is_uprn(""), FALSE)
})

test_that("Thireteen or more numbers return flase", {
  expect_equal(is_uprn(9999999999999), FALSE)
})

test_that("Thireteen or more characters return flase", {
  expect_equal(is_uprn("9999999999999"), FALSE)
})

test_that("Letters return false", {
  expect_equal(is_uprn("ABC"), FALSE)
})

test_that("Puntuation returns false", {
  expect_equal(is_uprn("1,"), FALSE)
})

test_that("Decimals return false", {
  expect_equal(is_uprn(111.999), FALSE)
})

test_that("Decimals in characters return false", {
  expect_equal(is_uprn("111.999"), FALSE)
})

test_that("Punctuation return false", {
  expect_equal(is_uprn("111-999"), FALSE)
})

test_that("Spaces return false", {
  expect_equal(is_uprn("111 999"), FALSE)
})

