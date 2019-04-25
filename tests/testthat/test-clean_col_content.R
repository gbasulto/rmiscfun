context("test-clean_col_content")


test_that("clean_col_content works", {
  input <- c("bart Simpson", "LisaSimpson", "maggie..simpson!",
          "MARGE-Simpson", "Homer Simpson :-)")
  output <- clean_col_content(input)
  expect_true(all(output == c("bart_simpson", "lisa_simpson",
                              "maggie_simpson", "marge_simpson",
                              "homer_simpson" )))
})

test_that("clean_col_content throws warning", {
  input <-
    factor(c("bart  Simpson", "LisaSimpson",
                "maggie..simpson!", "MARGE-Simpson", "bart  Simpson",
                "Homer Simpson :-)"))
  expect_warning(clean_col_content(input))
})

test_that("does nothing to numerical", {
  input <-
    as.factor(c("bart  Simpson", "LisaSimpson",
                "maggie..simpson!", "MARGE-Simpson", "bart Simpson",
                "Homer Simpson :-)"))
  expect_true(all(clean_col_content(1:10) == 1:10))
})
