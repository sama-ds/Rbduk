test_that("Space and upper case occur by default", {
  expect_equal(pretty_postcode("SW1a2nP"),"SW1A 2NP")
})

test_that("Seperator can be changed", {
  expect_equal(pretty_postcode("SW1a2nP",sep="."),"SW1A.2NP")
})

test_that("Seperator can be empty", {
  expect_equal(pretty_postcode("SW1a2nP",sep=""),"SW1A2NP")
})

test_that("Case can be changed", {
  expect_equal(pretty_postcode("SW1a2nP",uppercase=FALSE),"sw1a 2np")
})

test_that("Inputs above 8 characters are unchanged", {
  expect_equal(pretty_postcode("SW1a2nPoo",sep="-",uppercase=TRUE),"SW1a2nPoo")
})

test_that("Inputs below 5 characters are unchanged", {
  expect_equal(pretty_postcode("SW1a2nPoo",sep="-",uppercase=TRUE),"SW1a2nPoo")
})
