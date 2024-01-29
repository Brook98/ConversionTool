library(shiny)

# Source conversion functions
source('conversion_functions.R')

# Define UI
ui <- fluidPage(
  titlePanel("Unit Conversion Tool"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("conversionType", "Choose Conversion Type:", 
                  choices = c("Length", "Volume", "Mass", "Time", "Storage")),
      
      uiOutput("unitInputUI"),  # Dynamic UI for unit input
      
      numericInput("value", "Enter the Value to Convert:", value = 1),
      
      actionButton("convert", "Convert")
    ),
    
    mainPanel(
      textOutput("result")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  
  # Unit selection based on conversion type
  output$unitInputUI <- renderUI({
    if (input$conversionType == "Length") {
      list(
        selectInput("fromUnit", "From Unit:", choices = c("mm", "cm", "m", "km", "ft", "yd", "in", "mi")),
        selectInput("toUnit", "To Unit:", choices = c("mm", "cm", "m", "km", "ft", "yd", "in", "mi"))
      )
    } else if (input$conversionType == "Volume") {
      list(
        selectInput("fromUnit", "From Unit:", choices = c("ml", "cl", "l", "kl", "fl.oz.", "cup", "pt", "qt", "gal", "tbsp", "tsp")),
        selectInput("toUnit", "To Unit:", choices = c("ml", "cl", "l", "kl", "fl.oz.", "cup", "pt", "qt", "gal", "tbsp", "tsp"))
      )
    } else if (input$conversionType == "Mass") {
      list(
        selectInput("fromUnit", "From Unit:", choices = c("mg", "g", "kg", "oz", "lb", "st", "ton")),
        selectInput("toUnit", "To Unit:", choices = c("mg", "g", "kg", "oz", "lb", "st", "ton"))
      )
    } else if (input$conversionType == "Time") {
      list(
        selectInput("fromUnit", "From Unit:", choices = c("sec", "min", "hr", "day", "week", "month", "year")),
        selectInput("toUnit", "To Unit:", choices = c("sec", "min", "hr", "day", "week", "month", "year"))
      )
    } else if (input$conversionType == "Storage") {
      list(
        selectInput("fromUnit", "From Unit:", choices = c("bit", "B", "KB", "MB", "GB", "TB", "PB", "EB")),
        selectInput("toUnit", "To Unit:", choices = c("bit", "B", "KB", "MB", "GB", "TB", "PB", "EB"))
      )
    }
  })
  
  # Convert function
  convert <- eventReactive(input$convert, {
    result <- NULL
    if (input$conversionType == "Length") {
      result <- convert_length(input$value, input$fromUnit, input$toUnit)
    } else if (input$conversionType == "Volume") {
      result <- convert_volume(input$value, input$fromUnit, input$toUnit)
    } else if (input$conversionType == "Mass") {
      result <- convert_mass(input$value, input$fromUnit, input$toUnit)
    } else if (input$conversionType == "Time") {
      result <- convert_time(input$value, input$fromUnit, input$toUnit)
    } else if (input$conversionType == "Storage") {
      result <- convert_storage(input$value, input$fromUnit, input$toUnit)
    }
    format_result(result, input$toUnit)
  })
  
  # Output the result
  output$result <- renderText({
    req(convert())
    convert()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
