#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  
  #Text on the instruction page
  output$about1 <- renderUI(
    print("About")
  )
  output$about2 <- renderUI(
    h4("Understand concepts of Experimental Variables such as explanatory,
       response, confounding, and lurking variables.")
  )
  output$background1 <- renderUI(
    print("Background: Experimental Variables")
  )
  output$background2 <- renderUI(
    h4("A explanatory variable which is also known as the independent or predictor 
        variable, it explains variations in the response variable; in an experimental
        study, it is manipulated by the researcher")
    )
  output$background3 <- renderUI(
    h4("A response variable which is also known as the dependent or outcome variable,
        has a value is predicted or its variation is explained by the explanatory 
        variable; in an experimental study, this is the outcome that is measured 
        following manipulation of the explanatory variable.")
    )
  output$background4<- renderUI(
    h4("Lurking variables are extraneous variables which may cause an explanation 
        between the explanatory and response variables.")
  )
  output$background5<- renderUI(
    h4("Confounding variables occur when the experimental controls don’t allow the 
        experiment to eliminate other explanations to the relationship between the 
        independent and dependent variables.")
  )
  output$instruction1 <- renderUI(
    print("Instruction")
  )
  output$instruction2 <- renderUI(
    print("Step 1: Read the short paragraph on the experiment, while thinking what
          each variable may be.")   
  )
  output$instruction3 <- renderUI(
    print("Step 2: Use the drop down boxes to match the variable example with the 
          type of variable.")
  )
  output$instruction4 <- renderUI(
    print('Note: Reread prerequisites page if confused.')
  )
  
  output$ack1 <- renderUI(
    print("Acknowledgement and Credit")
  )
  output$ack2 <- renderUI(
    h4("This app was developed and coded by Sabrina Wang and TJ McIntyre.")
  )
})
