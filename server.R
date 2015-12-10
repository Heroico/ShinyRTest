# Define a server for the Shiny app
shinyServer(function(input, output) {

  # Filter data based on selections
  output$table <- renderDataTable({
    #data <- read.csv("data/results.csv")
    data <- read.csv("data/results.csv")
    data$p = 2*pnorm(-abs(data$zscore))
    data <- data[order(data$p),]
    if (nchar(input$gene_id) > 0){
      data <- data[grepl(input$gene_id, data$gene),]
    }
    if (nchar(input$gene_name) > 0){
      data <- data[grepl(input$gene_name,data$gene_name),]
    }
    t = 0.05
    if (input$threshold > 0) {
      t = input$threshold
    }
    data <- data[data$p < t,]
    data
  })
})

