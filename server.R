# Boxplot
# Load R packages/libraries
library(shiny)
library(RCurl)

tbs <- read.csv(text = getURL("https://raw.githubusercontent.com/wane199/Presentation/master/TBS/app/data/M_1018.csv"))

# Data pre-processing ----
# Tweak the "am" variable to have nicer factor labels -- since this
# doesn't rely on any user inputs, we can do this once at startup
# and then use the value throughout the lifetime of the app
# tbs$ <- factor(tbs$, labels = c("Automatic", "Manual"))


# Define server logic to plot various variables against mpg ----
shinyServer(function(input, output, session) {
  # Compute the formula text ----
  # This is in a reactive expression since it is shared by the
  # output$caption and output$mpgPlot functions
  formulaText <- reactive({
    paste("TBSL1L4 ~", input$variable)
  })
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  # Generate a plot of the requested variable against mpg ----
  # and only exclude outliers if requested
  output$boxPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = tbs,
            outline = input$outliers,
            col = "#75AADB", pch = 19)
  })
  output$summary <- renderPrint({
    summary(tbs)
  })
  
})

# Create Shiny app ----
# shinyApp(ui = ui, server = server)

