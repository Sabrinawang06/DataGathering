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
<<<<<<< HEAD
})
=======
#potential way of cycling through the paragraph questions, how they did it for the 
#challenges in the bias app
  #Randomly generate one question out of the four questions every time when "Next" button is clicked.
  index <- reactiveValues(index = 6)
  observeEvent(input$new,{
    index$index <- sample(1:6,1)
  })
  
  output$question <- renderUI({
    if (index$index == 1){
      h3("300 men and 300 women, with some being physically fit and some being obese, 
         are taken for an experiment of a new weight loss drug. The drug is administered
         to the men, and after a month the men experienced more weight loss than women")
    }else if (index$index == 2){
      h3("In a new experiment at a laboratory, 100 males will be going through testing
         for the effects of a vegetarian diet on muscle growth. The men are allowed to eat 
         anything they want as long as it is not meat. After two months, all of the men are 
         studied to see if they became more muscular")
    }else if (index$index == 3){
      h3("A team of veterinarians are comparing the effectiveness of fertility treatments on 
         tigers. The two treatments are in-vitro fertilization and male fertility medications. 
         The medications are distributed with 5 tigers getting in-vitro fertilizations and 
         15 tigers getting male fertility medications, because in-vitro is expensive. ")
    }else if (index$index == 4){
      h3("A group 16 college kids are looking into how two different study habits 
         influence their grade on their next Calculus exam. Eight of the kids will 
         study for 12 hours the day before the exam, while eight of the kids will 
         study for 2 hours a day for 5 days before the exam. They plan to compare 
         the average grade between the two groups after the exam.")
    }else if (index$index == 5){
      h3("A truck driving company wanted to examine whether they would save more money 
         on fuel if they used gasoline or diesel trucks. The company decided to examine
         10 of their diesel fueled trucks on the east coast of the United States, and 
         10 of their gasoline fueled trucks on the west coast of the United States. 
         After one month, they examined the cost of fuel for each truck and compared 
         the two.")
    }else if (index$index == 6){
      h3("Around Halloween, a dentist decided he wanted to experiment with a new 
         brand of cavity reducing toothpaste. He took ten of his teenager patients 
         and gave 5 of them the cavity reducing toothpaste and 5 of them normal 
         toothpaste. He told the cavity reducing tooth paste to brush once a day, 
         and the other group to brush twice a day. A month later he recorded which 
         group on average had more cavities.")
    }
  })

  
  
  
  
  
  
})

>>>>>>> 68c14fdbcefdfa2ee28dc47b26c933de33b8d0e2
