library(readxl)
library(tidyverse)
library(stringr)

term_table <- read_xlsx("./data/CLEAR Global PSEA glossary app export.xlsx")

concepts <- term_table[, c(1:3)]

concept_id <- term_table$`Concept ID`

languages_terms <- term_table[, c(4:687)] 

reshaped_table <- tibble(`Concept ID` = character(),
                         Language = character(),
                         Definition = character(),
                         `Term ID` = character(),
                         Term = character(),
                         Region = character(),
                         `Term type` = character(),
                         `Head term` = character()
                         )

col_add <- 5
col_start <- 1
col_end <- col_start + col_add

while (col_end < 684) {
  
  one_lang <- languages_terms[, c(col_start:col_end)] %>%
    mutate(across(everything(), as.character))
  #one_lang
  
  col_names <- str_remove(names(one_lang), "\\.\\.\\.[0-9]+") 
  names(one_lang) <- col_names
  #one_lang
  
  print(col_names[1])
  
  one_lang <- one_lang %>%
    add_column(Language = col_names[1], `Concept ID` = concept_id) %>%
    rename(Term = 1) %>%
    select(`Concept ID`, Language, Definition, `Term ID`, Term, Region, `Term type`, `Head term`) %>%
    filter(!is.na(`Term ID`))
  
  reshaped_table <- reshaped_table %>%
    bind_rows(one_lang)
  
  col_start <- col_end + 1
  col_end <- col_start + col_add
  
}

saveRDS(reshaped_table, "./data/reshaped_data.rds")
