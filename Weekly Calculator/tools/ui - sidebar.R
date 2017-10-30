ui_sidebar = dashboardSidebar(
  width = 350,
  
  sidebarMenu(
    
    menuItem("Summary",
             tabName = "summary",
             icon = icon("dashboard")
      
    ),
    
    menuItem("Data",
             tabName = "data",
             icon = icon("database")
      
    )
    
    
  ),
  
  selectInput("selweek", 
              "Select Week :",
              choices = files.vt,
              selected = files.vt[1])
  
)