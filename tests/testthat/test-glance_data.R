context("test-glance_data")


test_that("nas expected", {
  all_nas <- as.vector(glance_data(iris)[5, 4:6])
  expect_true(all(is.na(all_nas)))
})

test_that("check types",{
  output <- glance_data(iris)$type
  comparison <-
    output == c("numerical", "numerical", "numerical",
                "numerical", "factor")
  all_good <- all(comparison)
expect_true(all_good)
})

