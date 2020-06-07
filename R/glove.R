glove <- function(text, x_max, dim = 10, min_count = 5L, window = 5L,
                  n_iter = 10L, convergence_tol = 0.01, verbose = FALSE) {
  tokens <- space_tokenizer(text)
  it <- itoken(tokens, progressbar = FALSE)
  vocab <- create_vocabulary(it)
  vocab <- prune_vocabulary(vocab, term_count_min = min_count)
  vectorizer <- vocab_vectorizer(vocab)
  tcm <- create_tcm(it, vectorizer, skip_grams_window = window)
  glove <- GlobalVectors$new(rank = dim, x_max = x_max)

  if (verbose) {
    wv_main <- glove$fit_transform(tcm, n_iter = n_iter,
                                   convergence_tol = convergence_tol)
  } else {
    temp <- utils::capture.output(
      wv_main <- glove$fit_transform(tcm, n_iter = n_iter,
                                     convergence_tol = convergence_tol)
    )
  }

  wv_context <- glove$components
  word_vectors <- wv_main + t(wv_context)

  word_vectors <- word_vectors %>%
    as.data.frame() %>%
    rownames_to_column("tokens") %>%
    as_tibble()

  word_vectors
}
