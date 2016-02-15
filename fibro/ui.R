shinyUI(fluidPage(
  titlePanel("Score"),
  sidebarLayout(
    sidebarPanel(
      textInput("A", "A(ng/ml):", 0),
      textInput("B", "B(ng/ml):", 0),
      textInput("C", "C(μg/ml):", 0),
      actionButton("action", label = "Quit"),

      p('1. Please key in value of biomarker A, B and C, respectively.'),

      p('2. Score and Stage will be displayed.'),
      
      p('3. Press "Quit" button to quit system.'),
      
      p('4. Close the window.')
    
    ),
    mainPanel(fluidRow(
      column(12,
             dataTableOutput('contents')
      )
      )
    )  
  )
  )
  
)