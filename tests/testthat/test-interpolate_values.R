context("test-interpolate_values")

test_that("function works", {
  x <- c(1, 2, 4, 5)
  y <- c(1, 3, 7)
  z <- c("a", "b", "a")

  out <- interpolate_values(x, y, z)

  expect_true(all(out == c("a", "a", "b", "b")))
})
