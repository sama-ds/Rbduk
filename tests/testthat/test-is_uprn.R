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

test_that("Conversion error message occurs singular", {
  expect_message(
    is_uprn("1000000"),
    "UPRN ends in '0000'. This may be caused by a conversion error involving excel and scientific notation."
  )
})

test_that("Conversion error message occurs plural", {
  expect_message(
    is_uprn(c("1000000","200000","30000")),
    "3 UPRNs end in '0000'. This may be caused by a conversion error involving excel and scientific notation."
  )
})

test_that("Works with dplyr", {
  expect_equal(
    dplyr::mutate(
      data.frame(uprn=c("100","200x","x.o")),
      is_uprn=is_uprn(uprn)),
    data.frame(uprn=c("100","200x","x.o"),
               is_uprn=c(TRUE,FALSE,FALSE))
  )
})

test_that("allow_scientific functions",{
  expect_equal(
    is_uprn(c("1000000","200000","30000"), allow_scientific = FALSE),
    c(FALSE, FALSE, FALSE)
  )
})

