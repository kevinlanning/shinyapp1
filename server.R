library(shiny) 
score <- function(socsci, math, hack) {
        ifelse (socsci == 9 & math ==9 & hack ==9, 
               "You're skilled in Computational Social Science - but can you write?",
               ifelse(socsci < 5 & math < 5 & hack < 5,
                      "You are not yet prepared to do work in the Computational Social Sciences.", 
                      ifelse(socsci < 5 & math < 5,
                             "Substantive and methodological knowledge are needed to round out your team.",
                             ifelse(math < 5 & hack < 5,
                                    "You have some substantive knowledge, but programming and statistical expertise are needed.",
                                    ifelse(socsci < 5 & hack < 5,
                                           "You have some methodological skill, but substantive knowledge and computer skills are needed.",
                                           ifelse(socsci < 5,
                                                  "Substantive knowledge is needed to round out your team.",
                                                  ifelse(math < 5,
                                                         "Methodological knowledge is needed to round out your team.",
                                                         ifelse(hack < 5,
                                                                "Computer skills are needed to round out your team.", 
                                                                "You have some skills in all areas of Computational Social Science.")
                                                  )
                                           )
                                    )
                             )
                      )
               )
        )
}
shinyServer(function(input, output) { 
           sliderValues <- reactive({ 
                    data.frame( 
                               Name = c(# "Writing and communicative skill",
                                       "Social Science knowledge",
                                       "Quantitative Methods",
                                       "Computer Science"),
                               Value = as.character(c( #input$comm,
                                                      input$socsci,
                                                      input$math,
                                                      input$hack)),  
                               stringsAsFactors=FALSE) 
           })  
        output$values <- renderTable({ 
                sliderValues() 
                }) 
        output$recommendation <- renderText({c(score(input$socsci,input$math,input$hack))
        }) 
})
