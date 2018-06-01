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
                                  menuItem("Exploring", tabName = "horse", icon = icon("hand-o-right")),
                                  menuItem("Matching Game", tabName = "matching", icon = icon("bar-chart"),
                                          menuSubItem("Level 1",tabName='level1',icon='>>'),
                                          menuSubItem('Level 2',tabName='level2',icon='>>'),
                                          menuSubItem('Level 3',tabName='level3',icon='>>'))
                                       
                                     )
                                ),
               




dashboardBody(
  tags$head(
    theme = "bootstrap.css", #css theme
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "themestyle.css"))
  ),
  tabItems(
    tabItem(tabName = "prereqs",
            fluidPage(
              h1('Background'),
              h3('Categorical variable are variable which have Names or labels (i.e., categories) with no 
                 logical order or with a logical order but inconsistent differences 
                 between groups, also known as qualitative.'),
              h3('Categorical nominal variables are variables which are categories but
                 do not have a logical order'),
              h3("Categorical ordinal variables are variables which are categories with
                 some logical order present among them"),
              h3('Quantitative variable are variables which have numerical values with 
                 magnitudes that can be placed in a meaningful order with consistent 
                 intervals, also known as numerical.'),
              h3('Continuous variable are variables which have a characteristic that
                 varies and can take on any value and any value between values'),
              h3('Discrete variable are variables which have a characteristic that varies
                 and can only take on a set number of values')
            ),
            fluidRow(
              column(3,bsButton("start","Go to overview",icon("ravelry"),style = "danger",size = "large",class="circle grow"))
            ),br()
    ),
    
    
    
    tabItem(tabName = 'horse',
            h1('TBD')
      
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
            ),
            fluidRow(
              column(3,bsButton("go","Go",icon("ravelry"),style = "danger",size = "large",class="circle grow"))
            ),br()
           ),
    
    tabItem(tabName = "matching",
            fluidPage(
              h1('How to Play'),
              h2('Drag the variable names to the boxes by the variable types.
              Submit your answer only after finishing all the questions
              You may go to the next level only when you correct your answers
              The score you get after the first trial and the revised score you get after correct all answers will be weighted to generate your final score. 
              Keep in mind that both the final score and consumed time will determine whether you will be on the leaderboard!'),
              
             
            fluidRow(
              column(3,bsButton("go2",">>LEVEL 1",icon("ravelry"),style = "danger",size = "large",class="circle grow"))
            ),br()
    ),
    
    
    tabItem("level1",
             fluidPage(theme = "bootstrap.css", #css theme
                       tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "themestyle.css")), #link to your own css file
                       #tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "webkit.css")),
                      
                       fluidRow(
                         column(3, bsButton('bt1', '',icon = icon('time', lib = 'glyphicon',class = "icont fa-fw"),type = 'toggle', class = 'butt'),
                                bsButton('bq1', '',icon = icon('question',class = "iconq fa-fw"),type = 'toggle', class = 'butt'),
                                div(id = "plot-container",
                                    conditionalPanel("input.bq1 != 0",
                                                     tags$img(src = "STAT.png",
                                                              id = "hint"))
                                )
                         ),
                         column(3,offset = 6,
                                hidden(div(id='timer1h',textOutput("timer1"))
                                ))),br(), #print the timer
                       
                       conditionalPanel("input.go != 0", #Show everything only after the GO button is clicked
                                        #Set up all dragUIs which are randomly chosen from the question bank 
                                        fluidRow(
                                          wellPanel(dragUI(textOutput("disID1"),textOutput("disName1"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("disID2"),textOutput("disName2"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("nomID1"),textOutput("nomName1"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("contID1"),textOutput("contName1"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          
                                          wellPanel(dragUI(textOutput("disID3"),textOutput("disName3"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("contID2"),textOutput("contName2"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("nomID2"), textOutput("nomName2"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("ordID1"), textOutput("ordName1"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          
                                          wellPanel(dragUI(textOutput("contID3"),textOutput("contName3"),class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("ordID2"),textOutput("ordName2"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("nomID3"),textOutput("nomName3"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("contID4"),textOutput("contName4"), class = "drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          
                                          wellPanel(dragUI(textOutput("ordID3"),textOutput("ordName3"), class = "col-xs-12 col-sm-12 col-md-6 col-lg-2 drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("disID4"),textOutput("disName4"), class = "col-xs-12 col-sm-12 col-md-6 col-lg-2 drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("ordID4"),textOutput("ordName4"), class = "col-xs-12 col-sm-12 col-md-6 col-lg-2 drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dragUI(textOutput("nomID4"),textOutput("nomName4"), class = "col-xs-12 col-sm-12 col-md-6 col-lg-2 drag dragelement"), class = "wellTransparent col-sm-12 col-md-6 col-lg-2")
                                        ),hr(),
                                        
                                        #Set up all dropUIs and check/cross boxes
                                        fluidRow(
                                          h4("Quantitative & Discrete:", class = "col-sm-12 col-md-12 col-lg-3"),
                                          wellPanel(dropUI("drp1", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer1")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp2", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer2")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp3", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer3")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp4", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer4")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2")
                                        ), 
                                        fluidRow(
                                          h4("Quantitative & Continuous:", class = "col-sm-12 col-md-12 col-lg-3"),
                                          wellPanel(dropUI("drp5", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer5")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp6", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer6")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp7", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer7")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp8", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer8")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2")
                                        ),
                                        fluidRow(
                                          h4("Qualitative & Nominal:", class = "col-sm-12 col-md-12 col-lg-3"),
                                          wellPanel(dropUI("drp9", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer9")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp10", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer10")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp11", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer11")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp12", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer12")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2")
                                        ),
                                        fluidRow(
                                          h4("Qualitative & Ordinal:", class = "col-sm-12 col-md-12 col-lg-3"),
                                          wellPanel(dropUI("drp13", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer13")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp14", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer14")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp15", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer15")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2"),
                                          wellPanel(dropUI("drp16", class = "dropelement"),
                                                    div(style = "position:absolute;top: 10%;right:2%;",htmlOutput("answer16")), class = "wellTransparent col-sm-12 col-md-6 col-lg-2")
                                        ),hr(), 
                                        #Submit button and pagination button
                                        fluidRow(
                                          column(1,bsButton("previous3","<<Previous", style = "primary",size = "small")),
                                          column(1,offset = 4, 
                                                 conditionalPanel("(input.drp1!='') & (input.drp2!='') & (input.drp3!='') & (input.drp4!='') &
                                                                  (input.drp5!='') & (input.drp6!='') & (input.drp7!='') & (input.drp8!='') &
                                                                  (input.drp9!='') & (input.drp10!='') & (input.drp11!='') & (input.drp12!='') &
                                                                  (input.drp13!='') & (input.drp14!='') & (input.drp15!='') & (input.drp16!='')",
                                                                  bsButton("submitA", "Submit Answer", style = "primary",size = "small",class = "grow")
                                                 )
                                          ),
                                          column(1,offset = 5,bsButton("next2","Next>>",style = "primary", size = "small", disabled = TRUE))
                                          ),br()
                                          ),
                       
                       conditionalPanel("input.submitA != 0",wellPanel(
                         fluidPage(
                           fluidRow(
                             wellPanel(
                               #div(style = "position:absolute; top;50em; left:1em",
                               h4("Please drag the wrong answers into this PENALTY box and click the CLEAR button to restart."),
                               #   ),
                               dropUI("home1",class = "dropelement dropelementHome", col_n = 3),
                               
                               class = "wellTransparent col-lg-8"),
                             wellPanel(h4("Full score is 80 for level A."),
                                       div(style = "position:absolute; top:8em; right:2em",bsButton("clear","CLEAR",style = "danger")),
                                       verbatimTextOutput("scoreA"),class = "wellTransparent col-lg-4")
                           )
                         )
                       ))
                                        )
             #############################################################################################             
                       ),
    tabItem("level2", 
             
             fluidRow(
               column(3, bsButton('bt2', '',icon = icon('time', lib = 'glyphicon',class = "icont fa-fw"),type = 'toggle', class = 'butt'),
                      bsButton('bq2', '',icon = icon('question',class = "iconq fa-fw"),type = 'toggle', class = 'butt'),
                      div(id = "plot-container2",
                          conditionalPanel("input.bq2 != 0",
                                           tags$img(src = "STAT.png",
                                                    id = "hint"))
                      )
               ),
               column(3,offset = 6,
                      hidden(div(id='timer2h',textOutput("timer2"))
                      ))),br(), #print the timer
             
             
             conditionalPanel("input.next2 != 0",
                              fluidRow(wellPanel(div(style = "text-align:center", h4(textOutput("imgQ1"))),
                                                 uiOutput("image1", class = "picSize"),
                                                 div(style = 'position: relative; top:-15px;', dragUI("img1","A", style = "width: 100px; height: 40px;", class = 'drag dragelement dragelement2'))
                                                 ,class = "col-lg-6 col-md-12 wellBorder"),
                                       
                                       wellPanel(div(style = "text-align:center", h4(textOutput("imgQ2"))),
                                                 uiOutput("image2", class = "picSize"),
                                                 div(style = 'position: relative; top:-15px;', dragUI("img2","B", style = "width: 100px; height: 40px;", class = 'drag dragelement dragelement2'))
                                                 ,class = "col-lg-6 col-md-12 wellBorder")),
                              fluidRow(
                                fluidRow(wellPanel(
                                  dropUI("drop1",class = "dropelement dropelement2"),
                                  div(style = "position: absolute; top:0;left:1em",h5("Quantitative & Discrete")),
                                  div(style = "position: absolute; top:20%; right:8%;", htmlOutput("answer17")), class = "wellTransparent2 col-lg-3 col-md-6 col-sm-6 col-xs-12"),
                                  wellPanel(
                                    dropUI("drop2",class = "dropelement dropelement2"),
                                    div(style = "position: absolute; top:0;left:1em",h5("Quantitative & Continuous")),
                                    div(style = "position: absolute; top:20%; right:8%;", htmlOutput("answer18")), class = "wellTransparent2 col-lg-3 col-md-6 col-sm-6 col-xs-12"),
                                  wellPanel(
                                    dropUI("drop3",class = "dropelement dropelement2"),
                                    div(style = "position: absolute; top:0; left:1em",h5("Qualitative & Nominal")),
                                    div(style = "position: absolute; top:20%; right:8%;", htmlOutput("answer19")), class = "wellTransparent2 col-lg-3 col-md-6 col-sm-6 col-xs-12"),
                                  wellPanel(
                                    dropUI("drop4",class = "dropelement dropelement2"),
                                    div(style = "position: absolute; top:0; left:1em",h5("Qualitative & Ordinal")),
                                    div(style = "position: absolute; top:20%; right:8%;", htmlOutput("answer20")), class = "wellTransparent2 col-lg-3 col-md-6 col-sm-6 col-xs-12")
                                )
                              ),br(),
                              
                              fluidRow(wellPanel(div(style = 'position: relative; top:-5px;', dragUI("img3","C",style = "width: 100px; height: 40px;", class = 'drag dragelement dragelement2')),
                                                 div(style = "position:relative; text-align:center; top: -15px;", h4(textOutput("imgQ3"))),
                                                 div(style = "position:relative; top: -15px;",uiOutput("image3", class = "picSize"))
                                                 ,class = "col-lg-6 col-md-12 wellBorder"),
                                       wellPanel(div(style = 'position: relative; top:-5px;', dragUI("img4","D",style = "width: 100px; height: 40px;", class = 'drag dragelement dragelement2')),
                                                 div(style = "position:relative; text-align:center; top: -15px;",h4(textOutput("imgQ4"))),
                                                 div(style = "position:relative; top: -15px;",uiOutput("image4", class = "picSize"))
                                                 ,class = "col-lg-6 col-md-12 wellBorder")),
                              
                              fluidRow(column(1,bsButton("previous2","<<Previous",style = "primary", size = "small")),
                                       column(1,offset = 4,conditionalPanel("(input.drop1!='') & (input.drop2!='') & (input.drop3!='') & (input.drop4!='') & (input.drop5!='')",
                                                                            bsButton("submitB","Submit Answer", style = "primary", class = "grow", size = "small"))),
                                       column(1,offset = 5,bsButton("finish","STOP>>", style = "danger", disabled = TRUE, size = "small")))
                              ,hr(),
                              conditionalPanel("input.submitB != 0",wellPanel(
                                fluidPage(
                                  fluidRow(
                                    wellPanel(
                                      div(style = "position:absolute;top:9em; left:1em",h4("Please drag the wrong answers into this box and click the CLEAR to restart.")),
                                      dropUI("home2",class = "dropelement dropelementHome2", row_n = 2, col_n = 2),
                                      div(style = "position:absolute; top:8em; right:3em",bsButton("clearB","CLEAR",style = "danger")),class = "wellTransparent col-lg-8"),
                                    wellPanel(h4("Full score is 20 for level B."),
                                              verbatimTextOutput("scoreB"),class = "wellTransparent col-lg-4")
                                  )
                                )
                              ))
             )
             
             
    ),
    tabItem(title = "level3", 
            
             fluidRow(column(3,offset = 9,textOutput("timer3"))),br(),br(),
             fluidPage(
               fluidRow(h3("Your scores:")),
               fluidRow(
                 wellPanel(verbatimTextOutput("init"), class = "wellScore col-lg-4 col-md-6 col-sm-12"),
                 wellPanel(verbatimTextOutput("end"), class = "wellScore col-lg-4 col-md-6 col-sm-12"),
                 wellPanel(verbatimTextOutput("totalScore"), class = "wellScore col-lg-4 col-md-6 col-sm-12")
               ),br(),
               conditionalPanel("input.finish != 0",
                                fluidRow(
                                  wellPanel(
                                    wellPanel(textInput("name",h4("Please type in your nickname to submit the score:"),placeholder = "Nickname",width = 600),
                                              textOutput("checkName"),class = "col-lg-8 col-md-9 col-sm-10 col-xs-9"),
                                    
                                    wellPanel(div(style = "position:absolute; top:60px",bsButton("check","Submit",style = "danger",size = "large")),class = "col-lg-2 col-md-2 col-sm-1 col-xs-1"),style = "height:200px")
                                ),
                                
                                
                                #numericInput("time","Time",value = 1),
                                
                                #verbatimTextOutput("initial"),
                                
                                
                                
                                conditionalPanel("input.check != 0", dataTableOutput("highscore")),
                                actionButton("weekhigh", "Show Weekly High Scores"),
                                actionButton("totalhigh", "Show All-Time High Scores"))
               
             ))
    
             )
    
           
)
)
)        