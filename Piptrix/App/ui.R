#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyIncubator)

# Define UI for application that draws a histogram
shinyUI(
  navbarPage("Piptrix",
             theme="bootstrap.css",
             tabPanel(
               "Home",
               sidebarLayout(
                 tags$img(src="https://raw.githubusercontent.com/ZetaPhase/ZetaStock/ae1c1ce3b3621f007d7a803df3f603ee1075f985/zetastock.png", width="256", height="256"),
                 mainPanel(
                   h3(tags$p("Welcome to Piptrix, a matrix calculator developed by ZetaPhase Technologies.")),
                   h4(tags$p("About")),
                   htmlOutput("home"),
                   h4(tags$p("Links")),
                   tags$a(href="https://github.com/ZetaPhase/Piptrix", "Check out the source on GitHub"),
                   tags$br(),
                   tags$a(href="https://zetaphase.github.io/", "Visit the ZetaPhase Technologies website")
                 )
               )
             ),
             tabPanel(
               "Multiply",
               sidebarPanel(
                 fluidRow(
                   column(6, fluidRow(column(5, numericInput("mnrow1", "Rows", 2,1,10)),
                            column(5, numericInput("mncol1", "Columns", 2,2,10))),
                   uiOutput("mmatrix1")),
                   column(6, fluidRow(column(5, numericInput("mnrow2", "Rows", 2,1,10)),
                            column(5, numericInput("mncol2", "Columns", 2,2,10))),
                   uiOutput("mmatrix2"))
                 ),
                 width=10
               ),
               mainPanel(
                 fluidRow(
                   uiOutput("multiply")
                 )
               )
             ),
             tabPanel(
               "Add",
               sidebarPanel(
                 fluidRow(
                   column(6, fluidRow(column(5, numericInput("anrow1", "Rows", 2,1,10)),
                                      column(5, numericInput("ancol1", "Columns", 2,2,10))),
                          uiOutput("amatrix1")),
                   column(6, fluidRow(column(5, numericInput("anrow2", "Rows", 2,1,10)),
                                      column(5, numericInput("ancol2", "Columns", 2,2,10))),
                          uiOutput("amatrix2"))
                 ),
                 width=10
               ),
               mainPanel(
                 fluidRow(
                   uiOutput("add")
                 )
               )
             ),
             tabPanel(
               "Inverse",
               mainPanel(
                 matrixInput("tbl", "Enter Data", as.data.frame(matrix(0,nrow=4,ncol=4))))
             ),
             tabPanel(
               "Determinant"
             )
  )
)
