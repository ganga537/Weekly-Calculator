output$raw_data <- renderDataTable({
  
  combo <- combined_output()
  combo$raw_data.df %>% arrange(Date)
  
})
