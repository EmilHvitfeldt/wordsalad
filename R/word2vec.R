#' Extract word vectors from word2vec word embedding
#'
#' The calculations are done with the word2vec package.
#'
#' @param text Character string.
#' @param tokenizer Function, function to perform tokenization. Defaults to
#'    [text2vec::space_tokenizer].
#' @param collapse_character Character vector with length 1. Character used to
#'    glue together tokens after tokenizing. See details for more information.
#'    Defaults to \code{"\\t"}.
#' @param composition Character, Either "tibble", "matrix", or "data.frame" for
#'    the format out the resulting word vectors.
#' @param n_iter Integer, number of training iterations. Defaults to 5.
#' @param loss Charcter, choice of loss function must be one of "ns" or "hs".
#'    See detaulsfor more Defaults to "ns".
#' @inheritParams word2vec::word2vec
#'
#'
#' @details
#' A trade-off have been made to allow for an arbitrary tokenizing function. The
#' text is first passed through the tokenizer. Then it is being collapsed back
#' together into strings using \code{collapse_character} as the separator. You
#' need to pick \code{collapse_character} to be a character that will not appear
#' in any of the tokens after tokenizing is done. The default value is a "tab"
#' character. If you pick a character that is present in the tokens then those
#' words will be split.
#'
#' The choice of loss functions are one of:
#'    * "ns" negative sampling
#'    * "hs" hierarchical softmax
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
word2vec <- function(text,
                     tokenizer = text2vec::space_tokenizer,
                     dim = 50,
                     type = c("cbow", "skip-gram"),
                     window = 5L,
                     min_count = 5L,
                     loss = c("ns", "hs"),
                     negative = 5L,
                     n_iter = 5L,
                     lr = 0.05,
                     sample = 0.001,
                     stopwords = character(),
                     threads = 1L,
                     collapse_character = "\t",
                     composition = c("tibble", "data.frame", "matrix")) {

  if (dim < 0)
    stop("`dim` Must be a positive integer.")
  composition <- match.arg(composition)

  loss <- match.arg(loss)
  loss <- ifelse(loss == "hs", TRUE, FALSE)

  text <- pre_tokenize(text, tokenizer, collapse_character)
  stopwords <- paste(collapse_character,
                     stopwords,
                     collapse_character,
                     sep = "")

  model <- word2vec::word2vec(x = text,
                              type = type,
                              dim = dim,
                              window = window,
                              iter = n_iter,
                              lr = lr,
                              hs = loss,
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
