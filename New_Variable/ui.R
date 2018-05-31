library(shiny)
library(shinyDND)
library(shinyjs)
library(shinyBS)
library(V8)
library(grid)
library(RUnit)
library(shinydashboard)
library(png)

data <- read.csv("questionBank.csv")



ui<-dashboardPage(skin = 'black',
              dashboardHeader(title = "Variable Types", titleWidth = 195),
              dashboardSidebar(width = 195,
                              sidebarMenu(
                                  id = "tabs",
                                  menuItem("Prerequisites", tabName = "prereqs", icon=icon("dashboard")),
                                  menuItem("Overview", tabName = "instruction", icon = icon("dashboard")),
                                  menuItem("Exploring", tabName = "hand", icon = icon("hand-o-right")),
                                  menuItem("Matching Game", tabName = "summary", icon = icon("bar-chart"),
                                          menuSubItem("Level 1",tabName='level1',icon='coffee'),
                                          menuSubItem('Level 2',tabName='level2',icon='coffee'),
                                          menuSubItem('Level 3',tabName='level3',icon='coffee'))
                                       
                                     )
                                )
               )




dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  tabItems(
    tabItem(tabName = "prereqs",
            fluiPage(
              h1('Background'),
              h2('Categorical variable are variable which have Names or labels (i.e., categories) with no 
                 logical order or with a logical order but inconsistent differences 
                 between groups, also known as qualitative.'),
              h3('Categorical nominal variables are variables which are categories but
                 do not have a logical order'),
              h4("Categorical ordinal variables are variables which are categories with
                 some logical order present among them"),
              h5('Quantitative variable are variables which have numerical values with 
                 magnitudes that can be placed in a meaningful order with consistent 
                 intervals, also known as numerical.'),
              h6('Continuous variable are variables which have a characteristic that
                 varies and can take on any value and any value between values'),
              h7('Discrete variable are variables which have a characteristic that varies
                 and can only take on a set number of values')
            )
    ),
    tabItem(tabName = "instruction",
            fluidPage(
              h1('About'),
              h2('Identify four different variable types: Quantitative (numeric) discrete variables, Quantitative continuous variables, 
Qualitative (categorical) nominal variables, and Qualitative ordinal variables'),
              
              h1('Instruction'),
              
              h2('Click Go to start the first exploring game to learn about.... 
              then go to the second game.
              Drag the variable names to the boxes by the variable types.
              Submit your answer only after finishing all the questions
              You may go to the next level only when you correct your answers
              The score you get after the first trial and the revised score you get after correct all answers will be weighted to generate your final score. 
              Keep in mind that both the final score and consumed time will determine whether you will be on the leaderboard!'),
                
             h1('Acknowledgement and Credit'),
             h2('This app was developed and coded by Yuxin Zhang. Special thanks to Robert P. Carey III and Alex Chen for help on some programming issues.')
            )
           )
           )
)

           