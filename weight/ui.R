library(shiny)
library(treemap)
library(RColorBrewer)
library(ggplot2)
library(shinyBS)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Weight Adjustment On Sampling",
                  titleWidth = 180),
  dashboardSidebar(width = 180,
    sidebarMenu(id='tabs',
      menuItem('Pre-requisites', tabName='preq', icon=icon('book')),
      menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
      menuItem("Easy Level", tabName = "easy", icon = icon("gamepad")),
      menuItem("Hard Level", tabName = "hard", icon = icon("gamepad"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = 'preq',
              fluidPage(
                h1('Background'),
                
                h2("A selected sample may not be a good representation of a population due to many reasons. 
                   Non-response rate is one of the biggest challenges."),
                
                h2(   "When some variables measured in the survey are 
                   under- or over-represented, statisticians use a weighting adjustment as a common correction technique. "),

                 h2 ("Each survey respondent gets an adjustment weight. Subjects in underrepresented group get a weight more than one, 
                   and subjects in overrepresented group get a weight smaller than one."),
                
                fluidRow(column(2,bsButton("start","Go to overview",icon("bolt"),style = "danger",size = "large",class="circle grow")))
                
              )
        
      ),
      tabItem(tabName = "overview",
              
              fluidPage(
                tags$a(href='http://stat.psu.edu/',tags$img(src='logo.png', align = "left", width = 180)),
                br(),br(),
                h1("About"),
                h2("Explore how weighting adjustment affects the predicted results in survey analysis"),
                h1("Instructions"),
                h2("Move the sliders around to explore how the weighting adjustment affects the results. Use your best
                   judgement to find out the correct adjustment weight for each scenario. Notice that the summation
                   bar should never be larger than one because the weighted sample should never be larger than the population."),
                h1("Acknowledgements"),
                # h2("Jon Huang, Samuel Jacoby, Michael Strickland and K.K.Rebecca Lai (2016 Nov.8).",
                #    tags$a(href = "https://www.nytimes.com/interactive/2016/11/08/us/politics/election-exit-polls.html","Election 2016: Exit Polls.", style = "text-decoration: underline; color: #f08080"), 
                #    tags$i("New York Times.")),
                h2("This app was developed and coded by Yuxin Zhang and updated by Luxin Wang and Thomas McIntyre. The exit poll data set was extracted from", 
                   tags$a(href = "https://www.nytimes.com/interactive/2016/11/08/us/politics/election-exit-polls.html","Election 2016: Exit Polls.", style = "text-decoration: underline; color: #cd3333"),"on July 20, 2017.")
                ),
              
                fluidRow(
                column(8,uiOutput("instruction4")),
                column(3,bsButton("go","Go",icon("bolt"),style = "danger",size = "large",class = "circle grow"))
              )
               ),
      tabItem(tabName = "easy",
              fluidPage(
                theme = "theme.css",
                
                tags$head(tags$style("#successM{color: red;
                                     font-size: 12px;
                                     font-style: italic;
                                     }"
                         )),
                tags$head(tags$style("#successF{color: red;
                                     font-size: 12px;
                                     font-style: italic;
                                     }"
                         )),
                tags$head(tags$style("#successO{color: red;
                                     font-size: 20px;
                                     font-style: italic;
                                     }"
                        )),
                tags$head(tags$style("#successA{color: red;
                                     font-size: 20px;
                                     font-style: italic;
                                     }"
                        )),
                tags$head(tags$style("#successH{color: red;
                                     font-size: 20px;
                                     font-style: italic;
                                     }"
                        )),
                tags$head(tags$style("#successB{color: red;
                                     font-size: 20px;
                                     font-style: italic;
                                     }"
                        )),
                tags$head(tags$style("#successW{color: red;
                                     font-size: 20px;
                                     font-style: italic;
                                     }"
                        )),
                
                tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background:#AED6F1}")),
                tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background:#C0392B}")),
                
                titlePanel("Weighting adjustment with one auxiliary variable"),
                
                fluidPage(
                  fluidRow(
                    wellPanel(h4("In order to find out between The Ellen Show and The Late Night Show which one is more 
                                 popular in our campus, we did a survey on 100 students. However, this sample cannot 
                                 represent the population well because the proportion of females in this sample is much 
                                 larger than the proportion of males in the population. Therefore, we need weighting adjustment
                                 to the data we got. Based on the following table and proportion graph, can you guess what is the 
                                 correct weight? Try playing around with both sliders following the instruction."),
                              fluidRow(column(4,img(src = "image1.png", width = 200)),column(4,img(src = "image2.png", width = 300))))
                    ),
                  
                  fluidRow(
                   wellPanel(
                      fluidRow(h3("Left is the treemap of gender proportion in population.")), 
                      fluidRow(h3("Right is the treemap of gender proportion in the sample.")),br(),
                      fluidRow(h3("Area represents the proportion.")),
                      fluidRow(img(src = "arrow5.png", align = "right",width = 80))
                      , class = "col-lg-4 col-md-6 col-sm-12 col-xs-12"),
                    wellPanel(plotOutput("population"), class = "wellBorder col-lg-4 col-md-6 col-sm-12 col-xs-12"),
                    wellPanel(plotOutput("sample"), class = "wellBorder col-lg-4 col-md-6 col-sm-12 col-xs-12")
                  ),
                  fluidRow(
                    uiOutput("warning"),
                    uiOutput("progress"),
                    div(style = "position: relative; top:-15px", div(style = "float: left", print("0")),div(style = "float:right", print("n"))),
                
                    
                    bsTooltip(id='male', 'Use the weight 48/30, population divided by sample', placement='top', trigger='click'),
                    bsTooltip(id='female', 'Use the weight 52/70, population divided by sample', placement='top', trigger='click',option=NULL),
                    
                    wellPanel(
                      sliderInput("male","Weight for Male:", min = 0, value = 1, max = 2, step = 0.1),
                      textOutput("hintM"),
                      #conditionalPanel("input.male == 1.6", textOutput("successM")),
                      br(),
                      sliderInput("female","Weight for Female", min = 0, value = 1, max = 2, step = 0.02),
                      textOutput("hintF"),
                      #conditionalPanel("input.female == 0.74", textOutput("successF"))
                      class = "col-lg-4 col-md-6"),
                    
                    wellPanel(plotOutput("samplePop"), class = "wellBorder col-lg-3 col-md-6 col-sm-12 col-xs-12"),
                    wellPanel(plotOutput("bar"), class = "wellBorder col-lg-4 col-md-6 col-sm-12 col-xs-12")
                  ),
                  
                  fluidRow(
                    
                    column(12,conditionalPanel(condition = "(input.male == 1.6) & (input.female == 0.74)",
                                              wellPanel(h1(textOutput("Congrats")), 
                                                        h5("The proportion of female is larger than the proportion of male in the sample, which does not
                                                           represent the population well. Before the weighting adjustment, the supporting rate of
                                                           The Ellen Show is much higher than that of The Late Night Show, but after the weighting adjustment,
                                                           the supporting rate of The Ellen Show is almost the same with that of the Late Night Show."),
                                                        h5("This is a simple example of weighting adjustment with one auxiliary variable.
                                                           The population distribution is available so we can compare the response distribution of
                                                           sample with the population distribution."),
                                                        h5("We can make the response representative with respect to gender. The weight is
                                                           obtained by dividing the population percentage by the corresponding response percentage.
                                                           The weight for male is 48 / 30 = 1.6 . The weight for female is 52 / 70 = 0.74 ."),
                                                        h5("If you understand the weighting adjustment with the population distribution known,
                                                           please go to the hard level to explore the weighting technique with the population 
                                                           distribution unknown."))))
                    
                  )))
              ),
      tabItem(tabName = "hard",
              fluidPage(theme = "sliderColor.css",
                        titlePanel("Weighting adjustment with unknown population"),
                        
                        fluidPage(
                          fluidRow(
                            wellPanel(
                                fluidRow(
                                    column(5,h4("In order to predict the result of an election correctly, statisticians need to use a weighting adjustment to deal with
                                                 problems like non-response bias in analyzing samples. This is the exit poll data from 2016 election broken down by race/ethnicity.
                                                 Try playing around with the sliders to see how big a difference do weights make.")),
                                    column(6,offset = 1,img(src = "electionRace.jpg", width = 300))), class = "well1"),
                          
                            column(6,div(style = "height:260px;",plotOutput("elePopEW"))),
                            column(6, 
                              column(5,plotOutput("elePopWBar")),
                              column(5,div(style = "position: relative; left: 20px; top: 30px",
                                           h5("Weights for each variable:"),
                                div(style = "height:35px", sliderInput("other",label = NULL, min = 0, value = 0.5, max = 1, step = 0.3)),
                                div(style = "height:35px", sliderInput("asian",label = NULL, min = 0, value = 0.5, max = 1, step = 0.2)),
                                div(style = "height:35px", sliderInput("hispanic",NULL, min = 0, value = 0.5, max = 1, step = 0.01)),
                                div(style = "height:35px", sliderInput("black",NULL, min = 0, value = 0.5, max = 1, step = 0.3)),
                                div(style = "height:35px", sliderInput("white",NULL, min = 0, value = 1, max = 2, step = 0.7))
                              ))
                            ),
                            div(style = "position:relative; top:-140px",
                            column(7,uiOutput("warningB")), column(5,div(style = "margin-top:7px",img(src = "legend.png", width = 400))),
                            column(12,uiOutput("progressB")),
                            div(style = "position: relative; top:-15px", div(style = "float: left", print("0")),div(style = "float:right", print("n"))))
                          
                          ),
                          fluidRow(column(8, offset = 2,
                            div(style = "position:relative; top:-420px;",
                                      conditionalPanel(condition = "(input.white == 1.4) & (input.black == 0.6)
                                                      & (input.hispanic == 0.73) & (input.asian == 0.4) & (input.other == 0.6)",
                                                      wellPanel(h1(textOutput("Congradulation")), class = "transparentpanel"))))
                          )
                         
                            ))
              )
    )
  )
)
