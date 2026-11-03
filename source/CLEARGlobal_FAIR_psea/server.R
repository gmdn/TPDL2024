# Define server logic for random distribution app ----
server <- function(session, input, output) {
  
  src_filtered_table <- reactiveVal(NULL)
  
  trgt_filtered_table <- reactiveVal(NULL)
  
  concepts_table <- reactiveVal(NULL)
  
  languages_table <- reactiveVal(0)
  
  src_terms_table <- reactiveVal(NULL)
  
  trgt_terms_table <- reactiveVal(NULL)
  
  
  observeEvent(input$src_language, {
    
    req(input$src_language)
    
    # filter data given language
    temp <- data_table %>%
      filter(Language == input$src_language)
    
    # store filtered data in reactive elements
    src_filtered_table(temp)
    src_terms_table(temp)
    
    # update selection of terms
    updateSelectizeInput(inputId = "term",
                         choices = c("", sort(unique(src_filtered_table()$Term))),
                         server = TRUE, 
                         options = list(
                           placeholder = "Now select a term",
                           allowEmptyOption = TRUE
                         )
    )
    
    # update target language choices
    updateSelectizeInput(inputId = "trgt_language",
                         choices = c("", languages),
                         server = TRUE,
                         options = list(
                           placeholder = "Select a language (optional)",
                           allowEmptyOption = TRUE
                         )
    )
    
    concepts_table(NULL)
    
    trgt_filtered_table(NULL)
    
  })
  
  
  observeEvent(input$term, {
    
    req(input$term)
    
    # filter table given chosen term
    temp <- src_filtered_table() %>%
      filter(Term == input$term)
    
    # extract concept designated by chosen term
    concept <- src_filtered_table() %>%
      filter(`Concept ID` == temp$`Concept ID`) 
    
    src_terms_table(concept)
    
    # extract English definition
    temp2 <- concepts_definitions %>%
      filter(`Concept ID` == temp$`Concept ID`)
    
    # update definition table
    concepts_table(temp2$`PL Definition`)
    
  })
  
  output$en_def <- renderText({
    concepts_table()
  })
  
  output$src_results <- renderDataTable({
    
    req(src_terms_table())
    
    datatable(src_terms_table(),
              selection = 'none',
              editable = FALSE,
              escape = FALSE,
              rownames = FALSE,
              options = list(
                lengthChange = 0,
                autoWidth = TRUE
              )) %>% 
      formatStyle(columns = c(1, 4, 6, 7, 8), width='100px') %>%
      formatStyle(columns = c(2), width='150px') %>%
      formatStyle(columns = c(3, 5), width = "400px") %>%
      formatStyle(columns = c(5), width = "200px")
    
  }
  )
  
  observe({
    
    req(input$trgt_language, input$term)
    
    #trgt_filtered_table(tibble(a = sample(1:100, 2), b = sample(1:100, 2)))
    
    concept_id <- unique(src_terms_table()$`Concept ID`)
    
    temp <- data_table %>%
      filter(Language == input$trgt_language) %>%
      filter(`Concept ID` == concept_id)
    
    
    trgt_filtered_table(temp)
    
  })
  
  
  output$trgt_results <- renderDataTable({
    
    req(trgt_filtered_table())
    
    datatable(trgt_filtered_table(),
              selection = 'none',
              editable = FALSE,
              escape = FALSE,
              rownames = FALSE,
              options = list(
                lengthChange = 0,
                autoWidth = TRUE
              )) %>% 
      formatStyle(columns = c(1, 4, 6, 7, 8), width='100px') %>%
      formatStyle(columns = c(2), width='150px') %>%
      formatStyle(columns = c(3, 5), width = "400px") %>%
      formatStyle(columns = c(5), width = "200px")
    
  }
  )
  
}