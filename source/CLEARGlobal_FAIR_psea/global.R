library(shiny)
library(tidyverse)
library(DT)

data_table <- readRDS("./data/reshaped_data.rds")

concepts_definitions <- readRDS("./data/concepts_definitions.rds")

concepts <- sort(unique(data_table$`Concept ID`))

languages <- sort(unique(data_table$Language))

terms <- sort(unique(data_table$Term))
