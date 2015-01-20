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

#shinyUI(fluidPage(
#    titlePanel("Orlando Florida U.S. Climate Data"),
#    fluidRow(
#       column(2, wellPanel(
#           h4("Scale"),
#           radioButtons('tempType','Scale',c("Fahrenheit"=1,"Celsius"=2),selected=2),
#           h4("Month"),
#            radioButtons('monthRB','Month',c("January"=1,"February"=2,"March"=3,"April"=4,"May"=5,
#                                             "June"=6,"July"=7,"August"=8,"September"=9,"October"=10,
#                                             "November"=11,
#                                             "December"=12), selected=dateNumeric)
#        )),
#    
#        column(10, mainPanel(
#            plotOutput('newMonth')
#        ))
#    )
#))

#shinyUI(pageWithSidebar(
#    headerPanel("Data science FTW!"),
#   sidebarPanel(
#        h1('Sidebar panel'),
#        h1('H1 text'),
#        h2('H2 Text'),
#        h3('H3 Text'),
#        h4('H4 Text')
#    ),
#    mainPanel(
#        h3('Main Panel text'),
#        code('some code'),
#        p('some ordinary text')
#    )
#))

#shinyUI(pageWithSidebar(
#    headerPanel("Illustrating inputs"),
#    sidebarPanel(
#        numericInput("id1","Numeric input, labeled id1", 0, min = 0, max = 10, step = 1),
#        checkboxGroupInput("id2", "Checkbox",
#                           c("Value 1" = "1",
#                             "Value 2" = "2",
#                             "Value 3" = "3")),
#       dateInput("date", "Date:")
#   ),
#    mainPanel(
#        h3('Illustrating ouputs'),
#        h4('You entered'),
#        verbatimTextOutput("oid1"),
#        h4('You entered'),
#        verbatimTextOutput("oid2"),
#        h4('You entered'),
#        verbatimTextOutput("odate")
#    )
#))


#shinyUI(pageWithSidebar(
#    headerPanel("Example plot"),
#    sidebarPanel(
#        sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05,)
#    ),
#    mainPanel(
#        plotOutput('newHist')
#    )
#))