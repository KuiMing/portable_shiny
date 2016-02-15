# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
options(shiny.maxRequestSize = 9*1024^2)
options(digits = 7)
shinyServer(function(input, output) {
  

  
  output$contents <- renderDataTable({
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    cutoff=c(0.09,0.35,0.54)
    x=data.frame(FibA=as.numeric(input$A),
                 FibB=as.numeric(input$B),
                 FibC=as.numeric(input$C),
                 stringsAsFactors = FALSE)


   
    if (input$action){
      q()
    }
    
      x$score=exp(-3.8+2.8*x$FibA-4.01*x$FibB+0.7*x$FibC)/(1+exp(-3.8+2.8*x$FibA-4.01*x$FibB+0.7*x$FibC))
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