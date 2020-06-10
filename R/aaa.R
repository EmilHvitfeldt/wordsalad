pre_tokenize <- function(text, tokenizer, collapse = "\t") {
  tokens <- tokenizer(text)

  vapply(tokens, paste, collapse = collapse, FUN.VALUE = character(1))
}
