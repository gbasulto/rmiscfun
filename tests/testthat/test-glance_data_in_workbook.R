context("test-glance_data_in_workbook")

test_that("output format", {
  glance <-
    glance_data_in_workbook(iris)

  expect_true(is.list(glance))
})

test_that("size of each list element", {
  glance <- glance_data_in_workbook(iris)
  elements <- unlist(lapply(glance, nrow))

  expect_true(all(elements == c(5, 2, 0, 0, 0, 4, 1)))
})


