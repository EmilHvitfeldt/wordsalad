#' Extract word vectors from GloVe word embedding
#'
#' @param text Character string.
#' @param tokenizer Function, function to perform tokenization. Defaults to
#'    [text2vec::space_tokenizer].
#' @param dim Integer, number of dimension of the resulting word vectors.
#' @param x_max Integer, maximum number of co-occurrences to use in the
#'    weighting function. Defaults to 10.
#' @param min_count Integer, number of times a token should appear to be
#'    considered in the model. Defaults to 5.
#' @param window Integer, skip length between words. Defaults to 5.
#' @param n_iter Integer, number of training iterations. Defaults to 10.
#' @param convergence_tol Numeric, value determining the convergence criteria.
#'     \code{numeric = -1} defines early stopping strategy. Stop fitting
#'     when one of two following conditions will be satisfied: (a) passed
#'     all iterations (b) \code{cost_previous_iter / cost_current_iter - 1 <
#'     convergence_tol}. Defaults to -1.
#' @param verbose Logical, controls whether progress is reported as operations
#'     are executed.
#'
#' @return A [tibble][tibble::tibble-package] containing the token in the first
#'     column and word vectors in the remaining columns.
#' @export
#'
#' @source <https://nlp.stanford.edu/projects/glove/>
#' @references Jeffrey Pennington, Richard Socher, and Christopher D. Manning.
#'     2014. GloVe: Global Vectors for Word Representation.
#'
#' @examples
#' glove(fairy_tales, x_max = 5)
glove <- function(text, tokenizer = text2vec::space_tokenizer, dim = 10L,
                  x_max = 10L, min_count = 5L, window = 5L,
                  n_iter = 10L, convergence_tol = -1, verbose = FALSE) {
  tokens <- tokenizer(text)
  it <- text2vec::itoken(tokens, progressbar = FALSE)
  vocab <- text2vec::create_vocabulary(it)
  vocab <- text2vec::prune_vocabulary(vocab, term_count_min = min_count)
  vectorizer <- text2vec::vocab_vectorizer(vocab)
  tcm <- text2vec::create_tcm(it, vectorizer, skip_grams_window = window)
  glove <- text2vec::GlobalVectors$new(rank = dim, x_max = x_max)

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

  res <- as.data.frame(word_vectors)
  res <- tibble::rownames_to_column(res, "tokens")
  res <- tibble::as_tibble(res)

  res
}
