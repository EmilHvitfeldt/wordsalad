pre_tokenize <- function(text, tokenizer, collapse = "\t") {
  tokens <- tokenizer(text)

  vapply(tokens, paste, collapse = collapse, FUN.VALUE = character(1))
}

composer <- function(x, composition) {
  if (composition == "tibble") {
    x <- as.data.frame(x)
    x <- tibble::rownames_to_column(x, "tokens")
    x <- tibble::as_tibble(x)
  }

  if (composition == "data.frame") {
    x <- as.data.frame(x)
  }
  x
}
