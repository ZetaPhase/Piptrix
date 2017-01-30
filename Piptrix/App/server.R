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
    matrixInput("mtbl1", "Enter Data", as.data.frame(matrix(0,nrow=input$nrow1,ncol=input$ncol1)))
    #print("matrix1")
    #print(matrix(input$tbl1, input$nrow1, byrow=TRUE))
  })
  output$inmatrix2 <- renderUI({
    #if(is.null(input$tbl)) return(matrix(0,nrow=2,ncol=2))
    #print("matrix1")
    #print(matrix(input$tbl1, input$nrow1, byrow=TRUE))
    matrixInput("mtbl2", "Enter Data", as.data.frame(matrix(0,nrow=input$nrow2,ncol=input$ncol2)))
  })
  output$multiplyTable1 <- renderTable({input$mtbl1}, include.rownames=FALSE, include.colnames=FALSE)
  output$multiplyTable2 <- renderTable({input$mtbl2}, include.rownames=FALSE, include.colnames=FALSE)
  output$multiplyResult <- renderTable({matrix(input$mtbl1, nrow=input$nrow1)%*%matrix(input$mtbl2, nrow=input$nrow2)}, include.rownames=FALSE, include.colnames=FALSE)
  output$multiply <- renderUI({
    fluidRow(column(round(input$ncol1/2.0), tableOutput("multiplyTable1")),
             column(1, tags$img(src="https://img.clipartfest.com/c557392277f1546e726d9cf4fabd4070_download-multiplication-symbol-multiplication-symbol-clip-art_476-500.png", width=20, height=20, style=paste("margin-top: ", as.integer(10*input$nrow1), "px;", sep=""))),
             column(round(input$ncol2/2.0), tableOutput("multiplyTable2")),
             column(1, tags$img(src="http://backpackbeginnings.org/wp-content/uploads/2015/03/Equal-sign-250x180.png", width=25, height=25, style=paste("margin-top: ", as.integer(9*input$nrow1), "px;", sep=""))),
             column(5, tableOutput("multiplyResult")))
    
  })
})
