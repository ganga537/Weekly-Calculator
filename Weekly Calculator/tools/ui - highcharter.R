panel_highcharter <- fluidRow(
  
  
  box( width = 12,
       title = strong("Items"),
       status = "warning",
    highchartOutput("item_spending")
  )
  
)