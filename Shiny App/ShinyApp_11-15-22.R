#build from scratch, copy the minimum components
library(shiny)
library(tidyverse)

bcl <- read_csv("C:/Users/Tri Van/Desktop/UBC PhamSci/UBC Y2 FALL 2022/STAT 545A Exploratory Data Analysis/stat545/Shiny App/bcl-data.csv") #don't specify address will look for it in the current directory, better to use package here

#ggplot(bcl, aes(Alcohol_Content))+  geom_histogram()

ui <- fluidPage(
  sliderInput("priceInput", "Price", 0, 100,
              value=c(25,40),pre="$"),
  radioButtons("typeInput", "Type", choices= c("BEER", "REFRESHMENT","SPIRIT","WINE")),
  plotOutput("alcohol_hist")   
) 

#Step 1: plotOutput, need an identified to help link UI and serve component (capital O), in this case alcohol_hist
#Step 3: Add sliderinput, also require special id, in this case priceInput, the other ones can be explained using the help pages: title, min, max value, default value, add $ slide)
#Step 5: want to give options to filter alcohol type -> use radioButton

server <- function(input, output) {
  
  output$alcohol_hist <- 
    renderPlot({
      bcl %>% filter(Price > input$priceInput[1] &
                    Price < input$priceInput[2] &
                    Type == input$typeInput) %>% 
      ggplot(aes(Alcohol_Content)) +    
        geom_histogram() 
    })
}

# Step 2: assign alcohol_hist to output in server using a render/reactive function in this case wrap the ggplot function in the renderplot()
# Step 2.1: In case the code within renderplot is long, spanning multiple like, you will need to wrap everything in the curly bracket {} - try with/without curly
# Step 4: Run the pipe to include the priceInput to filter by price
#Step 5.1: Modify server to include Typeinput
shinyApp(ui = ui, server = server)
