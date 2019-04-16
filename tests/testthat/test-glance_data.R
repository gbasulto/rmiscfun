context("glance data function")


test_that("nas expected", {
  expect_true(all(is.na(as.vector(glance_data(iris)[5, 4:6]))))
})
