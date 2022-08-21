library(shiny)
library(shinythemes)


# Define UI for miles per gallon app ----
ui <- fluidPage(theme = shinytheme("slate"),
                
                # App title ----
                titlePanel("South China TBS app from JNU"),
                navbarPage("TBS app",
                           tabPanel("Home",
                                    # Sidebar layout with input and output definitions ----
                                    sidebarLayout(
                                      # Sidebar panel for inputs ----
                                      sidebarPanel(
                                        HTML("<h3>Input parameters</h3>"),
                                        # Input: Selector for variable to plot against mpg ----
                                        selectInput("variable", "Variable:",
                                                    c("Age" = "Age",
                                                      "BMI" = "BMI",
                                                      "BMDL1L4" = "BMDL1L4",
                                                      "TscoreL1L4" = "TscoreL1L4")),
                                        br(),
                                        img(src = "https://media.springernature.com/original/springer-static/image/art%3A10.1007%2Fs00198-011-1824-6/MediaObjects/198_2011_1824_Fig3_HTML.gif",
                                            height = 210, width = 360),
                                        br(),br(),
                                        img(src = "https://ts1.cn.mm.bing.net/th/id/R-C.c80600d38debc68a12b4b566886c8216?rik=bTkNEfTXK0fisg&riu=http%3a%2f%2fpicture.swwy.com%2fY2UzZDljYTQxNjhmNDI.jpg&ehk=WYS7zLiw1qw9kNUCW14LEMFnE2n0sOPMwjkmxBh71%2fs%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1",
                                            height = 210, width = 360),
                                        
                                        # Input: Checkbox for whether outliers should be included ----
                                        checkboxInput("outliers", "Show outliers", TRUE)
                                        
                                      ),
                                      
                                      # Main panel for displaying outputs ----
                                      mainPanel(
                                        # Output: Header + summary of distribution ----
                                        # Output: Formatted text for caption ----
                                        h3(textOutput("caption")),
                                        # Output: Plot of the requested variable against mpg ----
                                        plotOutput("boxPlot"),
                                        h3("Summary"),
                                        verbatimTextOutput("summary")
                                      )
                                    )),
                           
                           tabPanel("About",
                                    titlePanel("About"),
                                    div(includeMarkdown("./about.md"),
                                        align="justify")
                           )
                )
)