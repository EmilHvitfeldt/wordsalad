## code to prepare `fairy_tales` dataset goes here

library(hcandersenr)
library(tidyverse)

fairy_tales <- hcandersen_en %>%
  nest(data = c(text)) %>%
  mutate(text = map_chr(data, ~ paste(.x$text, collapse = " "))) %>%
  slice(1:5) %>%
  pull(text)

usethis::use_data(fairy_tales, overwrite = TRUE)
