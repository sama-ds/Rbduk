test_that("%!in% returns true with numbers", {
  expect_equal(2 %!in% c(1,3),TRUE)
})

test_that("%!in% returns true with letters", {
  expect_equal("b" %!in% c("a","c"),TRUE)
})

test_that("%!in% returns true with numbers", {
  expect_equal(2 %!in% c(1,2,3),FALSE)
})

test_that("%!in% returns true with letters", {
  expect_equal("b" %!in% c("a","b","c"),FALSE)
})

test_that("%!in% negates %in%", {
  expect_equal("b" %!in% c("a","b","c"), !"b" %in% c("a","b","c"), )
})
