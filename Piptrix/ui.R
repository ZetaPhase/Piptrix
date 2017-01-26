#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  navbarPage("Piptrix",
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
             )
  ))
