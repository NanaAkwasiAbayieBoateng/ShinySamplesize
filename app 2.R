
if (interactive()) {
  
  library(shiny)
  
  # Source helpers ----
 
  #source("/Users/nanaakwasiabayieboateng/Documents/memphisclassesbooks/DataMiningscience/Shiny/ShinySamplesize/confidence.R")
 
  source("https://raw.githubusercontent.com/NanaAkwasiAbayieBoateng/ShinySamplesize/master/confidence.R") 
  
  ui <- fluidPage(
    titlePanel("Confidence Level Estimator"),
    
    sidebarLayout(
      sidebarPanel(
        helpText(""),
                     
                  
        textInput(inputId = "caption",
                  label = "Caption:",
                  value = "Confidence Level"),
         
                 textInput(inputId ="population", label = h3("Population Size"), 
                           value = "0"),
        
         
                 textInput(inputId ="samplesize", label = h3("Sample Size"), 
                           value = "0"),
        
                 textInput(inputId ="MarginofError",label =  h3("Margin of Error"), 
                           value = "0"),
       
                 textInput(inputId ="Proportion",label =  h3("Proportion"),value="0"
        
              )
        
        
      ),
      
      mainPanel(
        
        # Output: Formatted text for caption ----
        h3(textOutput("caption", container = span)),
        
        
        #output value computed
        
        h3(textOutput("outputtext", container = span)))
      
      
    )
  )      
  
  
  
  # Define server logic ----
  server <- function(input, output) {
    
    
    # Note that because the data-oriented reactive expressions
    # below don't depend on input$caption, those expressions are
    # NOT called when input$caption changes
    output$caption <- renderText({
      input$caption
    })
    
    
 
    
    
    dataInput <- reactive({
      confidence_level(
                 
                 
                 
             SS=as.numeric(input$samplesize) ,
                 p=as.numeric(input$Proportion),
                 
                 E=as.numeric(input$MarginofError),
                 N=as.numeric(input$population ))
    })
    
    
    #output$value <- renderPrint({ input$checkGroup })
    #output$value <- renderPrint({ input$text })
    output$outputtext <- renderPrint({ 
      
     dataInput()
      
    })
    
  }
  
  # Run the app ----
  shinyApp(ui = ui, server = server)
  
  
  
  
}