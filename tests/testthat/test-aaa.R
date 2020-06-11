library(tibble)
x <- matrix(nrow = 5, ncol = 5)

rownames(x) <- letters[1:5]

test_that("composer works", {
  x_mat <- composer(x, "matrix")

  expect_equal(x_mat, x)

  x_df <- composer(x, "data.frame")

  expect_equal(x_df, as.data.frame(x))

  x_tbl <- composer(x, "tibble")

  expect_equal(x_tbl, tibble(tokens = letters[1:5],
                             V1 = NA,
                             V2 = NA,
                             V3 = NA,
                             V4 = NA,
                             V5 = NA))
})
