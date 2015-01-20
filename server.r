library(shiny)
#note this code is kept very simple to make evaluation easier
shinyServer(
    function(input, output) {
#conversion F to C : ((F-32)*5)/9
        tempHigh <- c(71,73,77,82,88,91,92,92,89,84,78,72)
        tempLow <- c(50,53,57,62,68,73,76,76,74,68,60,54)
#conversion inch to mm : inch*25.4        
        precipitation <- c(2.76,2.83,3.78,2.48,3.31,8.74,7.09,7.83,6.02,3.31,2.4,2.64)
        monthAbbrev <- c('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC')
        monthFull <- c('JANUARY','FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY','AUGUST',
                       'SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER')

        output$newMonth <- renderPlot({
            if (input$tempType == 1) {
              tempString <- 'fahrenheit'
              tempH <- tempHigh  
              tempL <- tempLow
              precString <- 'inches'
              precip <- precipitation
            }
            else {
              tempString <- 'celcius'
              tempH <- ((tempHigh-32)*5)/9
              tempL <- ((tempLow-32)*5)/9
              precString <- 'millimeters'
              precip <- precipitation*25.4
            }
          
            if (input$monthRB == 1) col1 <- 'red' else col1 <- 'blue' 
            if (input$monthRB == 2) col2 <- 'red' else col2 <- 'blue'
            if (input$monthRB == 3) col3 <- 'red' else col3 <- 'blue'
            if (input$monthRB == 4) col4 <- 'red' else col4 <- 'blue'
            if (input$monthRB == 5) col5 <- 'red' else col5 <- 'blue'
            if (input$monthRB == 6) col6 <- 'red' else col6 <- 'blue'
            if (input$monthRB == 7) col7 <- 'red' else col7 <- 'blue'
            if (input$monthRB == 8) col8 <- 'red' else col8 <- 'blue'
            if (input$monthRB == 9) col9 <- 'red' else col9 <- 'blue'
            if (input$monthRB == 10) col10 <- 'red' else col10 <- 'blue'
            if (input$monthRB == 11) col11 <- 'red' else col11 <- 'blue'
            if (input$monthRB == 12) col12 <- 'red' else col12 <- 'blue'
            colValues <- c(col1,col2,col3,col4,col5,col6,col7,col8,col9,col10,col11,col12)

#the barplot            
            bp <- barplot(tempH,names.arg=monthAbbrev,xlab='Month',ylab=paste('Temperature',tempString),
                          col=colValues)
#bar value labels            
            text(cex=1.0, x=bp, y=tempH+par("cxy")[2]/2, round(tempH,digits=0),
                 xpd=TRUE, col='darkgreen')

            output$oid1 <- renderText({monthFull[as.numeric(input$monthRB)]})
            output$oid2 <- renderText({paste(round(tempH[as.numeric(input$monthRB)],digits=2),tempString)})
            output$oid3 <- renderText({paste(round(tempL[as.numeric(input$monthRB)],digits=2),tempString)})
            output$oid4 <- renderText({paste(round(precip[as.numeric(input$monthRB)],digits=0),precString)})
        })

    }
)


#shinyServer(
#    function(input, output) {
#        output$oid1 <- renderPrint({input$id1})
#        output$oid2 <- renderPrint({input$id2})
#        output$odate <- renderPrint({input$date})
#    }
#)

#library(UsingR)
#data(galton)

#shinyServer(
#    function(input, output) {
#        output$newHist <- renderPlot({
#            hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
#            mu <- input$mu
#            lines(c(mu, mu), c(0, 200),col="red",lwd=5)
#            mse <- mean((galton$child - mu)^2)
#            text(63, 150, paste("mu = ", mu))
#            text(63, 140, paste("MSE = ", round(mse, 2)))
#        })
#        
#    }
#)
