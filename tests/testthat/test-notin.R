test_that("%notin% returns true with numbers", {
  expect_equal(2 %notin% c(1,3),TRUE)
})

test_that("%notin% returns true with letters", {
  expect_equal("b" %notin% c("a","c"),TRUE)
})

test_that("%notin% returns true with numbers", {
  expect_equal(2 %notin% c(1,2,3),FALSE)
})

test_that("%notin% returns true with letters", {
  expect_equal("b" %notin% c("a","b","c"),FALSE)
})


test_that("%notin% negates %in%", {
  expect_equal("b" %notin% c("a","b","c"), !"b" %in% c("a","b","c"), )
})



