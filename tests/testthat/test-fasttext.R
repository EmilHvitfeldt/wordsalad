text <- fairy_tales[1]

test_that("fasttext works", {
  dim <- 10
  min_count <- 5

  res <- fasttext(text, dim = dim, min_count = min_count)

  expect_type(res[[1]], "character")
  expect_true(all(vapply(res[-1], is.numeric, logical(1))))

  expect_equal(ncol(res), dim + 1)
  expect_equal(nrow(res), sum(table(unlist(strsplit(text, " "))) >= min_count))
})

test_that("fasttext dim argument works", {
  expect_equal(ncol(fasttext(text, dim = 10)), 10 + 1)
  expect_equal(ncol(fasttext(text, dim = 20)), 20 + 1)
  expect_error(ncol(fasttext(text, dim = -1)))
})

test_that("fasttext dim argument works", {
  expect_equal(
    nrow(fasttext(text, min_count = 5)),
    sum(table(unlist(strsplit(text, " "))) >= 5)
  )
  expect_equal(
    nrow(fasttext(text, min_count = 3)),
    sum(table(unlist(strsplit(text, " "))) >= 3)
  )
  expect_equal(
    nrow(fasttext(text, min_count = 0)),
    # +1 because of </s>
    sum(table(unlist(strsplit(text, " "))) >= 0) + 1
  )
})
