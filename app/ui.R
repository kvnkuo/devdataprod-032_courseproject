#
# ui.R for Course project
#
# This application will perform mpg prediction based on mtcars dataset
#

library(shiny)

# Define UI for the application
shinyUI(fluidPage(
    
    #  Application title
    headerPanel("Fuel Comsumption Prediction"),
    
    # Sidebar for data input
    sidebarLayout(
        sidebarPanel(
            # 1/4 mile time
            sliderInput("qsec", "1/4 mile time:",
                        min = 14.5, max = 22.9, value = 20, step = 0.1),
            # Wight
            sliderInput("wt", "Weight(lb/1000):",
                        min = 1.5, max = 5.5, value = 2, step = 0.1),
            # Transmission type
            selectInput("am", "Transmission:", 
                        choices = c("Automatic", "Manual")),
            # Calculate button to trigger calculation
            actionButton("actionButton", "Calculate"),
            # Hint
            helpText("Hint: For more information about this application, please refer to Help tab")
        ),
        
        # Tabset for both main and help tabs
        # Main tab is the main panel for prediction.
        # Help tab is the documentatuon for description and usage.
        mainPanel(width = 8,
            tabsetPanel(
                tabPanel("Main", 
                         h4("Predicted mile per gallon"),
                         h4(textOutput("predictedResult")),
                         h4("Input values"),
                         tableOutput("values")
                         ),
                tabPanel("Help",width = 8,
                         h4("About this application:"),
                         p( paste(c("This application try to predict the fuel consumption " ,
                            "based on the three factors: 1/4 mile time, weight " ,
                            "and transmission type. The prediction model is derived ",
                            "from the Motor Trend Car Road Tests dataset that was  ",
                            "extracted from the 1974 Motor Trend US magazine, and " ,
                            "comprises fuel consumption and 10 aspects of automobile ",
                            "design and performance for 32 automobiles (1973-74 models)")) ),
                         h4("Usage:"),
                         p( paste(c("The usage is simple. Just select 1/4 mile time, weight and ",
                            "transmission type then press Calculate button. The prediction ",
                            "result will be shown on the right-hand side.")) )
                         )
            )
        )
    )
))


