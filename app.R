#Juan

# install.packages("shiny")

library(shiny)

library(ggplot2)



# It defines the user interface, the HTML webpage that humans interact with. 

ui <- fluidPage(
  
  tags$h3("Scatter plot generator | Juan Rios "),
  
  selectInput(inputId = "x", label = "X Axis", choices = names(mtcars), selected = "mpg"),
  
  selectInput(inputId = "y", label = "Y Axis", choices = names(mtcars), selected = "hp"),
  
  plotOutput(outputId = "scatterPlot")
  
)



# It specifies the behavior of our app by defining a server function.

server <- function(input, output){
  
  data <- reactive({mtcars})
  
  output$scatterPlot <- renderPlot({
    
    ggplot(data = data(), aes_string(x = input$x, y = input$y), fill=drv) + 
      
      geom_area()  + ggtitle("Juan David")+ geom_point(size = 2)+

      theme_minimal() + 
      theme(
        legend.position = "top",
        axis.line = element_line(linewidth = 0.75),
        axis.line.x.bottom = element_line(colour = "blue")
      ) +
      theme(plot.background = element_rect(fill = "#ffe5b4")) + 
      theme(panel.background = element_rect(fill = "#cce5ff" )) 
      
    
  })
  
}



# Construct and start a Shiny application from UI and server.

shinyApp(ui = ui, server = server)

