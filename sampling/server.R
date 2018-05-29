

library(shiny)
library(shinydashboard)
library(png)



shinyServer(function(input, output, session) {
  
  output$here = renderDataTable({
    SATpublic
  }, options = list(orderClasses = TRUE))
  
  output$value <- renderPrint({ input$radio })
  
  output$value <- renderPrint({ input$radio1 })
  output$value <- renderPrint({ input$radio2 })
  
  
  })
    
  
  

