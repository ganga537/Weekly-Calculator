panel_raw_data <- fluidRow( 
  
  box(width = 12, 
      title = strong("Data"),
      status = "warning",
      dataTableOutput("raw_data")
      
      
  )
)
