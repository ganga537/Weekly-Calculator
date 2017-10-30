output$buyer <- renderDataTable({
  combo <- combined_output()
  combo$buyers.df
  
})

output$owes <- renderDataTable({
  
  combo <- combined_output()
  combo$owes.df
  
})