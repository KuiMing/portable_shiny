
options(shiny.maxRequestSize = 9*1024^2)
options(digits = 7)
shinyServer(function(input, output) {
  
  output$contents <- renderDataTable({
    cutoff=c(0.09,0.35,0.54)
    x=data.frame(A=as.numeric(input$A),
                 B=as.numeric(input$B),
                 C=as.numeric(input$C),
                 stringsAsFactors = FALSE)

    if (input$action){
      q()
    }
    
      x$score=exp(-3.8+2.8*x$A-4.01*x$B+0.7*x$C)/(1+exp(-3.8+2.8*x$A-4.01*x$B+0.7*x$C))
      if (x$score<cutoff[1]){
        x$stage='Health'
      }
      if (x$score>cutoff[1] & x$score<cutoff[2]){
        x$stage='Be Careful'
      }
      if (x$score>cutoff[2] & x$score<cutoff[3]){
        x$stage='Warning'
      }
      if (x$score>cutoff[3]){
        x$stage='God bless you!'
      }
      
      x
  })
  
})