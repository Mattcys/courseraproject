
povertybyage <-read.csv("./data/povertybyage.csv")
povertybyrace <-read.csv("./data/povertybyrace.csv")
povertybystate<-read.csv("./data/povertybystate.csv") 

shinyServer(function(input, output) {
  
  datasetInput<-reactive({
    switch(input$dataset,
      "povertybyage"= povertybyage,
      "povertybyrace"= povertybyrace,
      "povertybystate"= povertybystate)

  
    
  })
  
  fileext<-reactive({
    switch(input$type,
           "Excel(CSV)"="csv",
           "Text(TSV)"="tsv",
           "Doc"="doc")
    
    
  })
  
  output$table<-renderTable({
    datasetInput( )
  })
  
  output$downloadData<-downloadHandler(
  
filename=function(){
  paste(input$dataset,fileext(),sep=".")
  
},

content=function(file){
sep=switch(input$type,"Excel(CSV)"=",","Text(TSV)"="\t","Doc"=" ")  

write.table(datasetInput(),file, sep = sep, 
row.names=FALSE) 

}
)

  
})
