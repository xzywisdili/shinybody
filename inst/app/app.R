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
    verbatimTextOutput(outputId = "debug"),
    verbatimTextOutput(outputId = "debug2")
  )
}

server <- function(input, output) {
  patient_rows <- reactive({
    df[df$sample_id == input$select_patient,]
  })

  output$human <- renderHuman({
    g <- ifelse(unique(patient_rows()$gender) == "F", "female", "male")
    primary_tumor <- unique(patient_rows()$cancer_origin)
    metastases <- unique(patient_rows()$metastasis_area)
    colors <- c("black", rep("blue", length(metastases)))
    names(colors) <- c(primary_tumor, metastases)
    hovertext <- c("Primary Tumor", rep("Metastais", length(metastases)))
    names(hovertext) <- c(primary_tumor, metastases)
    human(
      gender = g,
      shown = c(primary_tumor, metastases),
      selected = primary_tumor,
      show_color = colors,
      select_color = "red",
      hovertext = hovertext
    )
  })
  output$debug <- renderPrint({
    primary_tumor <- unique(patient_rows()$cancer_origin)
    paste(
      "Selected patient's cancer originates from",
      primary_tumor
    )
  })
  output$debug2 <- renderPrint(input$clicked_body_part)
}

shinyApp(ui = ui, server = server)
