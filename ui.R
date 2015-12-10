dt <- read.csv("data/results.csv")

shinyUI(fluidPage(
  fluidPage(
    titlePanel("Zscores"),

    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4,
          textInput("gene_id",
                      "Gene ID:",
                      "")
      ),
      column(4,
          textInput("gene_name",
                      "Gene Name:",
                      "")
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
