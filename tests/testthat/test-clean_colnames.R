context("test-clean_colnames")


test_that("clean_colnames works", {
  input <- c("bart Simpson", "LisaSimpson", "maggie..simpson!",
          "MARGE-Simpson", "Homer Simpson :-)")
  output <- clean_colnames(input)
  expect_true(all(output == c("bart_simpson", "lisa_simpson",
                              "maggie_simpson", "marge_simpson",
                              "homer_simpson" )))
})

test_that("clean_colnames throws warning", {
  input <- c("bart Simpson", "LisaSimpson", "maggie..simpson!",
             "MARGE-Simpson", "bart-Simpson", "Homer Simpson :-)")
  expect_warning(clean_colnames(input))
})
