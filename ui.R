library(shiny)
shinyUI(fluidPage( 
        titlePanel("Are you ready to do research in Computational Social Science?"), 
        h5 ("This expands on Conway's (2010) model of Computational Social Science as a Venn diagram."),
       sidebarLayout( 
 
                    sidebarPanel(
                        h3("Ratings"),
                        em("Please rank your expertise in the following three areas using the following scale:"),
                        strong("0 = low, 5 = adequate, 9 = high"),
                        br(),
                        br(),
                        # sliderInput("comm", "Writing/presenting",  min = 0, max = 9, value = 5, step= 1), 
                        sliderInput("socsci", "Social Science Expertise",  min = 0, max = 9, value = 5, step= 1),
                        sliderInput("math", "Quantitative Methods",  min = 0, max = 9, value = 5, step= 1),
                        sliderInput("hack", "Computer Science",  min = 0, max = 9, value = 5, step= 1)
                        ),
                mainPanel(
                      img(src='ccsvenn.jpg', height = 250),
                        tableOutput("values"),
                      strong("Assessment:"),
                      tags$style(type='text/css', '#recommendation {
                                 color: red;}'), 
                      verbatimTextOutput("recommendation"),
                      em("code is available at https://github.com/kevinlanning/shinyapp1")
                        ) 
                ) 
        ))

