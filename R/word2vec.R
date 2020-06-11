#' Extract word vectors from word2vec word embedding
#'
#' @param text Character string.
#' @param tokenizer Function, function to perform tokenization. Defaults to
#'    [text2vec::space_tokenizer].
#' @param collapse_character Character vector with length 1. Character used to
#'    glue together tokens after tokenizing. See details for more information.
#'    Defaults to \code{"\\t"}.
#' @param composition Character, Either "tibble", "matrix", or "data.frame" for
#'    the format out the resulting word vectors.
#' @inheritParams word2vec::word2vec
#'
#'
#' @details
#' A trade-off have been made to allow for an arbitrary tokenizing function. The
#' text is first passed through the tokenizer. Then it is being collapsed back
#' together into strings using \code{collapse_character} as the seperater. You
#' need to pick \code{collapse_character} to be a character that will not appear
#' in any of the tokens after tokenizing is done. The default value is a "tab"
#' character. If you pick a character that is present in the tokens then those
#' words will be split.
#'
#' @return A [tibble][tibble::tibble-package], data.frame or matrix containing
#'     the token in the first column and word vectors in the remaining columns.
#'
#' @source <https://papers.nips.cc/paper/5021-distributed-representations-of-words-and-phrases-and-their-compositionality.pdf>
#' @references Mikolov, Tomas and Sutskever, Ilya and Chen, Kai and Corrado,
#'     Greg S and Dean, Jeff. 2013. Distributed Representations of Words and
#'     Phrases and their Compositionality
#'
#' @export
#' @examples
#' word2vec(fairy_tales)
#'
#' # Custom tokenizer that splits on non-alphanumeric characters
#' word2vec(fairy_tales, tokenizer = function(x) strsplit(x, "[^[:alnum:]]+"))
word2vec <- function(text, tokenizer = text2vec::space_tokenizer,
                     type = c("cbow", "skip-gram"), dim = 50, window = 5L,
                     iter = 5L, lr = 0.05, hs = FALSE, negative = 5L,
                     sample = 0.001, min_count = 5L, stopwords = character(),
                     threads = 1L, collapse_character = "\t",
                     composition = c("tibble", "data.frame", "matrix")) {

  if (dim < 0)
    stop("`dim` Must be a positive integer.")
  composition <- match.arg(composition)

  text <- pre_tokenize(text, tokenizer, collapse_character)
  stopwords <- paste(collapse_character,
                     stopwords,
                     collapse_character,
                     sep = "")

  model <- word2vec::word2vec(x = text,
                              type = type,
                              dim = dim,
                              window = window,
                              iter = iter,
                              lr = lr,
                              hs = hs,
                              negative = negative,
                              sample = sample,
                              min_count = min_count,
                              split = c(collapse_character, ".\n?!"),
                              stopwords = stopwords,
                              threads = threads)

  word_vectors <- as.matrix(model)

  res <- composer(word_vectors, composition = composition)

  res
}
