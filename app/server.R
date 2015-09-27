#
# ui.R for Course project
#
# This application will perform mpg prediction based on mtcars dataset
#
library(shiny)
data(mtcars)

# defined the model
fit <- lm(mpg ~ wt + qsec + am, data = mtcars)
# Define the server logic
shinyServer(function(input, output) {
    # Reactive expression to calculated mpg value
    calc <- reactive({
        amvalue <- ifelse(input$am=="Automatic",0,1)
        mpg <- predict(fit, list(wt=input$wt,qsec=input$qsec,am=amvalue))
        round(mpg,3)
    })

    # Reactive expression to compose a data frame containing all of
    # the values
    sliderValues <- reactive({
        # Compose data frame
        data.frame(
            Name = c("Weight (lb/1000)",
                     "1/4 mile time",
                     "Transmission"),
            Value = as.character(c(input$wt,
                                   input$qsec,
                                   input$am)), 
            stringsAsFactors=FALSE)
    })
    # Show the predicted value
    output$predictedResult <- renderText({
        input$actionButton
        isolate(calc())
    })
    # Show the input values using an HTML table
    output$values <- renderTable({
        input$actionButton
        isolate(sliderValues())
    })
})


