#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyIncubator)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$home <- renderUI({
    str1 <- paste("Piptrix is an open-source web-based matrix calculator built with R Shiny that provides many different features.")
    str2 <- paste("This analyzer was built by Xeliot from ZetaPhase Technologies.")
    str3 <- paste("If you're a developer, feel free to check out the source code on GitHub from the link below!.")
    HTML(paste(str1, str2, str3, sep='<br/>'))
  })
  
  output$inmatrix1 <- renderUI({
    #if(is.null(input$tbl)) return(matrix(0,nrow=2,ncol=2))
    print(input$tbl)
    print(matrix(input$tbl, input$nrow1, byrow=TRUE))
    matrixInput("tbl1", "Enter Data", as.data.frame(matrix(0,nrow=input$nrow1,ncol=input$ncol1)))
  })
  output$inmatrix2 <- renderUI({
    #if(is.null(input$tbl)) return(matrix(0,nrow=2,ncol=2))
    matrixInput("tbl2", "Enter Data", as.data.frame(matrix(0,nrow=input$nrow2,ncol=input$ncol2)))
  })
  output$showtable <- renderTable({input$tbl})
})
