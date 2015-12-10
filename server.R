library(shiny)


# Define a server for the Shiny app
shinyServer(function(input, output) {

  # Filter data based on selections
  output$table <- renderDataTable({
    #data <- read.csv("data/results.csv")
    data <- read.csv("data/results_3.csv")
    if (input$gene_id != "All"){
      data <- data[data$gene == input$gene_id,]
    }
    if (input$gene_name != "All"){
      data <- data[data$gene_name == input$gene_name,]
    }
    data
  })
})

