dashboardPage(
  skin = "yellow",
  dashboardHeader(title = "Weekly Expense Calculator", 
                  titleWidth = 350
                  ),
  ui_sidebar,
  
  dashboardBody(
    
    tabItems(
      tabItem( tabName = "summary",
               panel_infobox,
               panel_infobox_share,
               panel_DT_contribution,
               panel_DT_owes,
               panel_highcharter
        
      ),
      
      tabItem( tabName = "data",
               panel_raw_data
               
      )
      
    )
    
  )
  
)

