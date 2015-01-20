library(UsingR) 
library(shiny) ##must be loaded prior to running 'runApp()'
#default to the current month
dateNumeric <- as.numeric(format(Sys.Date(), "%m"))

shinyUI(pageWithSidebar(
    headerPanel("Orlando Florida U.S. Climate Data"),
    sidebarPanel(
        h3("Scale"),
        radioButtons('tempType',NULL,c("Fahrenheit/Inches"=1,"Celsius/Millimeters"=2),selected=1),
        h3("Month"),
        radioButtons('monthRB',NULL,c("January"=1,"February"=2,"March"=3,"April"=4,"May"=5,
                     "June"=6,"July"=7,"August"=8,"September"=9,"October"=10,"November"=11,
                     "December"=12), selected=dateNumeric),
        h4("Instructions:"),
        helpText("Select the desired Scale and Month.  The graph displays the average high ",
                 "temperatures for Orlando Florida, with the selected Month colored red.  ",
                 "Below the graph the average high and low temperatures, and the ",
                 "precipitation for the selected Month are displayed.")
    ),
    mainPanel(
        plotOutput('newMonth'),
        h4("Selected month"),
        verbatimTextOutput("oid1"),
        h4("Average high temperature"),
        verbatimTextOutput("oid2"),
        h4("Average low temperature"),
        verbatimTextOutput("oid3"),
        h4("Average precipitation"),
        verbatimTextOutput("oid4")
    )
))

