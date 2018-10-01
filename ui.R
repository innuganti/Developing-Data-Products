#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/

library(shiny)
shinyUI(fluidPage(
        
        titlePanel("Predict Cholestrol from the Size/Weight of the Egg"),
        sidebarLayout(
                sidebarPanel(
                        
                        sliderInput("Slider_Size", "What is the Weight(grams) of the Egg?", 20,70, value = 38),
                        
                        checkboxInput("showMedium", "Move the button to determine the weight", value = TRUE )),
                
                mainPanel(

                        h2(textOutput("pred1"),style = "color:blue"),
                       
                        h3(style = "color:blue; font-family:'Comic Sans MS'", 
                             ("Predicted Cholestrol from Egg")),
                        
                        textOutput("pred2"))
        )
        
))
