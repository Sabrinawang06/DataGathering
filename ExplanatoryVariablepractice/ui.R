library(shiny)
library(shinydashboard)
library(png)
library(shinyBS)
library(V8)
library(shinyjs)

#This is for practice and to potentially use if we cant figure 
#out how to do the combined one

# Define UI for application that draws a histogram
shinyUI <- dashboardPage(skin = "black",
                      dashboardHeader(title = "Experimental Variables",
                                      titleWidth = 200),
                      #adding prereq pages
                      dashboardSidebar(
                        width = 220,
                        
                        sidebarMenu(id='tabs',
                                    menuItem("Pre-requisites", tabName= "prereq", icon=icon("dashboard")),
                                    menuItem("Overview",tabName = "instruction", icon = icon("dashboard")),
                                    menuItem("Game",tabName = "game", icon = icon("th"))
                        )
),

dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "navcolor.css") #customised style sheet
  ),
  tabItems(
    tabItem(tabName = "instruction",
            fluidRow(
              column(11,offset = 1, uiOutput("about1"))
            ),
            fluidRow(
              column(1,img(src = "right.png", width = 30)),
              column(11,uiOutput("about2"))
            ),br(),
            
            br(),
            fluidRow(
              column(11,offset = 1, uiOutput("instruction1"))
            ),
            fluidRow(
              column(1,img(src = "right.png", width = 30)),
              column(11,uiOutput("instruction2"))
            ),
            fluidRow(
              column(1,img(src = "right.png", width = 30)),
              column(11,uiOutput("instruction3"))
            ),
            fluidRow(
              column(1,img(src = "right.png", width = 30)),
              column(8,uiOutput("instruction4")),
              column(5,bsButton("go","Go",icon("ravelry"),style = "danger",size = "large",class="circle grow"))
            ),br(),
            fluidRow(
              column(11,offset = 1, uiOutput("ack1"))
            ),
            fluidRow(
              column(1,img(src = "right.png", width = 30)),
              column(11, uiOutput("ack2"))
            )
            
    ),
    #Adding pre-requisites page to remove background from instructions page
    tabItem(tabName="prereq",
            fluidRow(
              column(11,offset = 1, uiOutput("background1"))
            ),
            fluidRow(
              column(1,img(src = "right.png", width = 30)),
              column(11,uiOutput("background2"))
            ),
            fluidRow(
              column(1,img(src = "right.png", width = 30)),
              column(11,uiOutput("background3"))
            ), 
            fluidRow(
              column(1,img(src = "right.png", width = 30)),
              column(11,uiOutput("background4"))
            ), 
            fluidRow(
              column(1,img(src = "right.png", width = 30)),
              column(11,uiOutput("background5"))
            ), 
              fluidRow(
                column(3,offset=1,bsButton("start","Go to the overview",icon("ravelry"),style = "danger",size = "large",class="circle grow"))
              )
              
            )
    )



)
)
