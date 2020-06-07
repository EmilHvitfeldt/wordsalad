## code to prepare `fairy_tales` dataset goes here

library(hcandersenr)
library(tokenizers)

fairy_tales <- hcandersen_en %>%
  nest(data = c(text)) %>%
  mutate(text = map_chr(data, ~ paste(.x$text, collapse = " "))) %>%
  pull(text)

usethis::use_data(fairy_tales, overwrite = TRUE)
