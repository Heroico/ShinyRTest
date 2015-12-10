dt <- read.csv("data/results.csv")

shinyUI(fluidPage(
  fluidPage(
    titlePanel("Zscores"),

    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4,
          selectInput("gene_id",
                      "Gene ID:",
                      c("All",
                        unique(as.character(dt$gene))))
      ),
      column(4,
          selectInput("gene_name",
                      "Gene Name:",
                      c("All",
                        unique(as.character(dt$gene_name))))
      ),
      column(4,
          numericInput("threshold",
                      "Pvalue threshold:",
                      0.05)
      )
    ),
    # Create a new row for the table.
    fluidRow(
      dataTableOutput(outputId="table")
    )
  )
))
