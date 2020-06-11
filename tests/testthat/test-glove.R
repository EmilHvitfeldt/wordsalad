text <- fairy_tales[1]

test_that("glove works", {
  dim <- 10
  min_count <- 5

  res <- glove(text, dim = dim, min_count = min_count)

  expect_type(res[[1]], "character")
  expect_true(all(vapply(res[-1], is.numeric, logical(1))))

  expect_equal(ncol(res), dim + 1)
  expect_equal(nrow(res), sum(table(unlist(strsplit(text, " "))) >= min_count))
})

test_that("glove dim argument works", {
  expect_equal(ncol(glove(text, dim = 10)), 10 + 1)
  expect_equal(ncol(glove(text, dim = 20)), 20 + 1)
  expect_error(ncol(glove(text, dim = -1)))
})

test_that("glove dim argument works", {
  expect_equal(
    nrow(glove(text, min_count = 5)),
    sum(table(unlist(strsplit(text, " "))) >= 5)
  )
  expect_equal(
    nrow(glove(text, min_count = 3)),
    sum(table(unlist(strsplit(text, " "))) >= 3)
  )
  expect_equal(
    nrow(glove(text, min_count = 0)),
    sum(table(unlist(strsplit(text, " "))) >= 0)
  )

})

test_that("glove stopwords argument works", {

  no_stopwords <- glove(text)$tokens

  stopwords <- no_stopwords[1:5]

  with_stopwords <- glove(text, stopwords = stopwords)$tokens

  expect_equal(
    setdiff(no_stopwords, with_stopwords),
    stopwords
  )
})
