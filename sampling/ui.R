library(shiny)
library(shinydashboard)
library(png)


dashboardPage(
  dashboardHeader(title = "Sampling Techniques"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("About", tabName = "about", icon = icon("dot")),
      menuItem("Visualization", tabName = "dashboard", icon = icon("asterisk")),
      menuItem("Data", tabName = "data", icon = icon("th")),
      menuItem("Game", tabName = "game", icon = icon("play"))
      
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "about",
              "text"),
      
      tabItem(tabName = "dashboard",
              fluidRow(
              column(width = 6,
                     box(
                       title = "Are public schools in Pennsylvania receiving a proper education?", width = NULL, status = "primary",
                       "There are 500 public schools in Pennsylvania and we are wondering if these schools are receiving a proper education.  Using data on SAT test scores from 2016, choose a sampling method to see how the schools would be selected for it.  Are the results across the board the same?",
                       selectInput("select", label = h4("Choose a Sampling Technique"), 
                                   choices = list("Select" = 1, "Simple Random Sample" = 2, "Systematic" = 3, "Clustering" = 4, "Stratified" = 5),
                                   selected = 1)
                       
                     )),
              
              
              column(width = 6,
                     box(
                      title= "Districts of Public Schools", width = NULL, solidHeader = TRUE, status = "warning",
                    
                      conditionalPanel(condition = "input.select == 1",
                                       img(src='paschool.png',align = "left", height = '250px',width = '500px')),
                      
                      conditionalPanel(condition = "input.select == 2",
                                      img(src ='simplerandomsample.png', align = "left", height = '250px', width= '500px'),
                                      "Schools are randomly selected according to a random number generator using the school district numbers"),
                      conditionalPanel(condition = "input.select == 3",
                                       "systematic"),
                      conditionalPanel(condition = "input.select == 4",
                                       img(src='clusteringpic.png', align = "left", height = '250px', width = '500px'),
                                       "Three counties were randomly selected and all of the schools in that county are being sampled."),
                      conditionalPanel(condition = "input.select == 5",
                                       img(src='stratifiedsample.png', align= "left", height = '250px', width='500px'),
                                       "Two schools are randomly selected from each county in PA")
                      
                    
                     )
              )
           
              ),
              
           
              fluidRow(
                column(width = 6,
                       box(
                         title = "National SAT Distribution", width = NULL, solidHeader = TRUE, status = "warning",
                         "The national average score was a 1080 with a standard deviation of 194 points.",
                         img(src='nationaldistribution.png', align = "left", height = '233px', width = '500px')
                         
                         
                       )),
                column(width = 6,
                       box(
                         title = "Sampling Distribution for PA", width = NULL, status = "primary",
                         "here is the output for PA"
                       )))
      ),
      
     
      
           tabItem(tabName = "data",
          dataTableOutput("here")),
      
      tabItem(tabName = "game",
              fluidRow(
                column(width = 12,
                       box(
                         title = "Let's play!", width = NULL, status = "primary",
                         "Below are a select group of images representing different sampling techniques. Select to see if you know which is correct!",
                         br(),
                         img(src='systematicsampleclassroom.png', align = "left", height = '375px', width = '361px'),
                         br(),
                         "Students in a classroom are numbered and the students with an odd number are chosen to see if peanut butter sandwiches are popular",
                         radioButtons("radio", label = h1("Choose!"),
                                      choices = list("Clustering" = 1, "Stratified" = 2, "Systematic" = 3), 
                                      selected = 0),
                         conditionalPanel(condition = "input.radio == 1",
                                          "Incorrect! Try again"),
                         conditionalPanel(condition = "input.radio == 2",
                                          "Incorrect! Try again"),
                         conditionalPanel(condition = "input.radio == 3",
                                          "Correct!"),
                         br(),
                         br(),
                         br(),
                         br(),
                         br(),
                         br(),
                         br(),
                         br(),
                         br(),
                      
                         
                         img(src='strataexample1.png',align="left",height = '350px', width = '600px'),
                         "Two states are randomly chosen by region to see what music taste is most popular.",
                         radioButtons("radio1", label = h1("Choose!"),
                                      choices = list("Clustering" = 1, "Stratified" = 2, "Systematic" = 3, "Simple Random Sample" = 4), 
                                      selected = 0),
                         conditionalPanel(condition = "input.radio1 == 1",
                                          "Incorrect! Try again"),
                         conditionalPanel(condition = "input.radio1 == 2",
                                          "Correct!"),
                         conditionalPanel(condition = "input.radio1 == 3", 
                                          "Incorrect! Try again"),
                         conditionalPanel(condition = "input.radio1 == 4",
                                          "Incorrect! Try again"),
                         
                         br(),
                         br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                        br(),
                         img(src='clusteringsample.png',align="left",height='458px', width='410px'),
                         "Parents are concerned if sports balls are at risk for being swallowed by their young children.  The following samples were taken based off circumference.",
                         "here",
                        radioButtons("radio2",label=h1("Choose!"),
                                     choices = list("Systematic" = 1, "Simple Random Sample" = 2, "Statified" = 3, "Clustering" = 4),
                                     selected = 0),
                        conditionalPanel(condition = "input.radio2 == 1",
                                         "Incorrect! Try again"),
                        conditionalPanel(condition = "input.radio2 == 2", 
                                         "Incorrect! Try again"),
                        conditionalPanel(condition = "input.radio2 == 3",
                                         "Incorrect! Try again"),
                        conditionalPanel(condition = "input.radio2 ==4",
                                         "Correct!"
                         
                       )))
  
              )
    )
)
)
)


