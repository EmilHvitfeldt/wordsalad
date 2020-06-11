#' Extract word vectors from fasttext word embedding
#'
#' @param text Character string.
#' @param tokenizer Function, function to perform tokenization. Defaults to
#'    [text2vec::space_tokenizer].
#' @param dim Integer, number of dimension of the resulting word vectors.
#' @param min_count Integer, number of times a token should appear to be
#'     considered in the model. Defaults to 5.
#' @param type Character, the type of algorithm to use, either 'cbow' or
#'     'skip-gram'. Defaults to 'skip-gram'.
#' @param window Integer, skip length between words. Defaults to 5.
#' @param n_iter Integer, number of training iterations. Defaults to 10.
#'     \code{numeric = -1} defines early stopping strategy. Stop fitting
#'     when one of two following conditions will be satisfied: (a) passed
#'     all iterations (b) \code{cost_previous_iter / cost_current_iter - 1 <
#'     convergence_tol}. Defaults to -1.
#' @param loss Charcter, choice of loss function must be one of "ns", "hs", or
#'     "softmax". See detaulsfor more Defaults to "hs".
#' @param negative integer with the number of negative samples. Only used when
#'     loss = "ns".
#' @param verbose Logical, controls whether progress is reported as operations
#'     are executed.
#' @param threads number of CPU threads to use. Defaults to 1.
#' @param composition Character, Either "tibble", "matrix", or "data.frame" for
#'    the format out the resulting word vectors.
#'
#' @details
#'    The choice of loss functions are one of:
#'    * "ns" negative sampling
#'    * "hs" hierarchical softmax
#'    * "softmax" full softmax
#'
#' @return A [tibble][tibble::tibble-package], data.frame or matrix containing
#'     the token in the first column and word vectors in the remaining columns.
#'
#' @source <https://fasttext.cc/>
#' @references Enriching Word Vectors with Subword Information, 2016, P.
#'     Bojanowski, E. Grave, A. Joulin, T. Mikolov.
#'
#' @export
#' @examples
#' fasttext(fairy_tales)
#'
#' # Custom tokenizer that splits on non-alphanumeric characters
#' fasttext(fairy_tales, tokenizer = function(x) strsplit(x, "[^[:alnum:]]+"))
fasttext <- function(text, tokenizer = text2vec::space_tokenizer, dim = 10L,
                  min_count = 5L, negative = 5L, loss = "hs",
                  type = c("skip-gram", "cbow"),
                  window = 5L, n_iter = 5L, threads = 1L,
                  verbose = FALSE,
                  composition = c("tibble", "data.frame", "matrix")) {

  composition <- match.arg(composition)
  type <- match.arg(type)
  type <- gsub("-", "", type)
  text <- pre_tokenize(text, tokenizer, " ")
  tmp_file_txt <- tempfile()
  tmp_file_model <- tempfile()
  writeLines(text = text, con = tmp_file_txt)
  fastrtext::execute(commands = c(type,
                                  "-input", tmp_file_txt,
                                  "-output", tmp_file_model,
                                  "-verbose", ifelse(verbose, 2, 0),
                                  "-dim", dim,
                                  "-minCount", min_count,
                                  "-ws", window,
                                  "-epoch", n_iter,
                                  "-thread", threads,
                                  "-neg", negative,
                                  "-loss", loss))

  model <- fastrtext::load_model(paste0(tmp_file_model, ".bin"))

  word_vectors <- fastrtext::get_word_vectors(model)
  res <- composer(word_vectors, composition = composition)

  res
}
