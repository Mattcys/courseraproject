
library(shiny)

shinyUI(fluidPage(
  titlePanel(title=h2("Poverty In The USA",align="center")),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Figures are in the Thousands and Data is based on the 
               US Census Bureau data on Poverty."),
      br(),
      br(),
      selectInput("dataset", 
                  label="Choose a Table to Display", choices = c("povertybyage","povertybyrace",
                                                                   "povertybystate"),
                  selected ="povertybyage")),
    
    
    mainPanel(
      tableOutput('table'),
      br(),
      br(),
      br(),
      downloadButton('downloadData','download'),
      br(),
      br(),
      helpText("Please Pick A Format For Download"),
      br(),
      br(),
      radioButtons("type", label="Format",choices=c("Excel(CSV)","Text(TSV)","Doc"))
      
      
    )
    )  
))
