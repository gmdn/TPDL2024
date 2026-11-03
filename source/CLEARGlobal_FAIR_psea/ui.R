# Define UI for random distribution app ----
ui <- fluidPage(
  
  # App title ----
  #titlePanel("CLEAR Global termbase"),
  titlePanel("CLEAR Global FAIR termbase"),
  
  fluidRow(
    
    # column(3, selectInput(inputId = "concept", 
    #                       label = "Concept", 
    #                       choices = c("all", concepts))),
    
    column(3, selectizeInput(inputId = "src_language", 
                             label = "Source language", 
                             choices = languages,
                             options = list(
                               placeholder = "Please select a source language",
                               onInitialize = I('function() { this.setValue(""); }')
                             )
    )
    ),
    
    column(3, selectizeInput(inputId = "term", 
                             label = "term", 
                             choices = NULL,
                             options = list(
                               placeholder = "First select a source language"
                             )
    )
    ),
    
    column(1, ),
    
    column(3, selectizeInput(inputId = "trgt_language", 
                             label = "Target language", 
                             choices = NULL,
                             options = list(
                               placeholder = "First select a source language"
                             )
    )
    )
    
  ),
  
  hr(),
  
  fluidRow(
    
    column(2, 
           h4("English definition: ")),
    
    column(6, 
           textOutput(outputId = "en_def")
    ),
    
    column(1, ),
    
    column(2, 
           actionButton(inputId = "download_tbx", label = "Download TBX")
    )
    
  ),
  
  hr(),
  
  h4("Source Table"),
  
  DTOutput(outputId = "src_results"),
  
  hr(),
  
  h4("Target Table"),
  
  DTOutput(outputId = "trgt_results")
  
)

