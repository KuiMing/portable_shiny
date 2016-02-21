logfile=dir()
logfile=logfile[grepl('[0-9]+',logfile)]
file.remove(logfile)
shiny::runApp("./shiny/",port=8888,launch.browser=TRUE)