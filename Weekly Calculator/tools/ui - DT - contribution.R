panel_DT_contribution <- fluidRow( 
  
    box(width = 12, 
       title = strong("Contribution"),
       status = "warning",
       dataTableOutput("buyer")
  
       
  )
)
  
  
panel_DT_owes <-  fluidRow(
    
    box( width = 6, 
       title = strong("Payment"), 
       status = "warning",
       dataTableOutput("owes", height = "425px")
       
       
  ),
  
  box(width = 6,
    title = "Network",
    status = "warning",
    visNetworkOutput("network")
    
    
  )
  
  
  )