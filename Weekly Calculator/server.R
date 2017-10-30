shinyServer(function(input,output){
  

  source(file.path(paste0(".",dir.tools), "server - reactive - dataframes.R"), local = TRUE)
  source(file.path(paste0(".",dir.tools), "server - infobox.R"), local = TRUE)
  source(file.path(paste0(".",dir.tools), "server - infobox - share.R"), local = TRUE)
  source(file.path(paste0(".",dir.tools), "server - DT - contribution.R"), local = TRUE)
  source(file.path(paste0(".",dir.tools), "server - highcharter.R"), local = TRUE)
  source(file.path(paste0(".",dir.tools), "server - raw - data.R"), local = TRUE)
  source(file.path(paste0(".",dir.tools), "server - visnetwork.R"), local = TRUE)
  
  
})