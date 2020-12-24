data(swiss)
print(swiss)
library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Fertility using Swiss Dataset"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderAgr", "% of males involved in agriculture", 0, 90, value=45),
            sliderInput("sliderEd", "% of draftees with education beyond primary school", 0, 60, value=30),
            sliderInput("sliderCat", "% catholics (as opposed to protestants)", 0, 100, value=50),
            sliderInput("sliderMort", "live births who live less than 1 year", 10, 30, value=20),
            submitButton("Submit")
        ),
        mainPanel(
            tabsetPanel(type = "tabs",
            tabPanel("Results", br(),
            h3("Predicted Fertility Based on Model:"),
            h2(textOutput("pred")),
            h4("The model is based on the swiss dataset, i.e. the Swiss Fertility and Socioeconomic Indicators (1888) Data."),
            h4("The data includes a standardized fertility measure and socio-economic indicators for each of 47 French-speaking provinces of Switzerland at about 1888."),
            h4("Here I present the results of a model that predicts the fertility measure based on four socio-economic indicators:"),
            tags$ul(
                tags$li("Percentage of males involved in agriculture"),
                tags$li("Percentage of draftees with education beyond primary school"),
                tags$li("Percentage of catholics (as opposed to protestants)"),
                tags$li("Infant mortality measure")
            ),
            h3("To test the app, please use the sliders on the left to input data for the model and press the submit button once you are ready. The result will appear on the screen at the top."),
            h3("You can examine the relationship between Fertility and each of the four factors by clicking on the tabs.")
        ),
            tabPanel("Agriculture", br(), h3("Fertility and Agriculture"), plotOutput("plotAgr")),
            tabPanel("Education", br(), h3("Fertility and Education"), plotOutput("plotEd")),
            tabPanel("Catholic", br(), h3("Fertility and Catholic"), plotOutput("plotCat")),
            tabPanel("Infant.Mortality", br(), h3("Fertility and Infant.Mortality"), plotOutput("plotMort")))
        )
    )
))
