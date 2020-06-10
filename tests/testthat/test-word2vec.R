text <- fairy_tales[1:2]

test_that("word2vec works", {
  dim <- 10
  min_count <- 5

  res <- word2vec(text, dim = dim, min_count = min_count)

  expect_type(res[[1]], "character")
  expect_true(all(vapply(res[-1], is.numeric, logical(1))))

  expect_equal(ncol(res), dim + 1)
  # +1 to account for stop signal </s>
  expect_equal(nrow(res), sum(table(unlist(text2vec::space_tokenizer(text))) >= min_count) + 1)
})

test_that("word2vec dim argument works", {
  expect_equal(ncol(word2vec(text, dim = 10)), 10 + 1)
  expect_equal(ncol(word2vec(text, dim = 20)), 20 + 1)
  expect_error(ncol(word2vec(text, dim = -1)))
})

test_that("word2vec dim argument works", {
  expect_equal(
    nrow(word2vec(text, min_count = 5)),
    # +1 to account for stop signal </s>
    sum(table(unlist(strsplit(text, " "))) >= 5) + 1
  )
  expect_equal(
    nrow(word2vec(text, min_count = 3)),
    # +1 to account for stop signal </s>
    sum(table(unlist(strsplit(text, " "))) >= 3) + 1
  )
  expect_equal(
    nrow(word2vec(text, min_count = 0)),
    # +1 to account for stop signal </s>
    sum(table(unlist(strsplit(text, " "))) >= 0) + 1
  )
})

test_that("word2vec stopwords argument works", {

  no_stopwords <- word2vec(text)$tokens

  new_stopwords <- no_stopwords[1:5]

  with_stopwords <- word2vec(text, stopwords = new_stopwords)$tokens

  expect_equal(
    setdiff(no_stopwords, with_stopwords),
    new_stopwords
  )

  no_stopwords <- word2vec(text, collapse_character = " ")$tokens

  new_stopwords <- no_stopwords[1:5]

  with_stopwords <- word2vec(text, stopwords = new_stopwords, collapse_character = " ")$tokens

  expect_equal(
    setdiff(no_stopwords, with_stopwords),
    new_stopwords
  )
})
