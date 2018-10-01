# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/

# The Data obtained from this website: https://www.eggnutritioncenter.org/egg-nutrition-facts-panels/

library(shiny)
library(ggplot2)

# Read data
eggs <- read.csv("/Users/innugantii/Desktop/Indu/Coursera/9 Develping Data Products/Week 4/EGG.csv", header = TRUE)

# Define server logic

shinyServer(function(input, output) {

# Model fit        
        eggs$Wtsp <- ifelse(eggs$Wt - 38 > 0, eggs$Wt -38,0)
        
        Medium <- lm(Cholestrol ~ Wt, data = eggs)
 
# Get the Prediction from model       
        
        Mediumpred <- reactive({
                
                WtInput <- input$Slider_Size
                
                predict( Medium, newdata = data.frame(Wt = WtInput))
        })
        
# create the output       
    
        output$pred1 <- renderText({
                
        Mediumpred()
                
        })
})
