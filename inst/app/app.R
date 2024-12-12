library(shiny)
library(shinybody)

# read in data
data_path <- system.file("data", "cancer_dataset.csv", package = "shinybody")
df <- read.csv(data_path, header = TRUE)

distinct_patients <- unique(df$sample_id)

ui <- function() {
  fluidPage(
    selectInput(
      inputId = "select_patient",
      label = "Select Patient",
      choices = distinct_patients,
      multiple = FALSE,
      selected = distinct_patients[1]
    ),
    humanOutput(outputId = "human"),
    verbatimTextOutput(outputId = "debug")
  )
}

server <- function(input, output) {
  patient_rows <- reactive({
    df[df$sample_id == input$select_patient,]
  })
  patient_cancer_msg <- reactive({
    paste(
      "Selected patient's cancer originates from",
      paste(patient_rows()$cancer_origin, collapse = ", ")
    )
  })

  output$human <- renderHuman({
    g <- unique(patient_rows()$gender)
    if (g == "F") {
      patient_gender <- "female"
    } else {
      patient_gender <- "male"
    }
    human(gender = patient_gender)
  })
  output$debug <- renderPrint(patient_cancer_msg())
}

shinyApp(ui = ui, server = server)
