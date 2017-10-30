output$eggsbox <- renderInfoBox({
  
  combo <- combined_output()
  
  infoBox(strong("EGGETARIAN"), 
          width = 3,
          subtitle = "spent on eggs",
          paste0("$",combo$share.df %>% 
                   filter(Type == "egg") %>% 
                   select(Total) %>% 
                   .[["Total"]]
          ),
          icon = icon("circle-o","fa-2x"),
          color = "aqua",
          fill = TRUE
  )
  
})

output$vegbox <- renderInfoBox({
  
  combo <- combined_output()
  
  infoBox(strong("VEGETARIAN"),
          width = 3,
          subtitle = "spent on veggies",
          paste0("$",combo$share.df %>% 
                   filter(Type == "veg") %>% 
                   select(Total) %>% 
                   .[["Total"]]
          ),
          icon = icon("tree","fa-2x"),
          color = "green",
          fill = TRUE
  )
  
})

output$nonvegbox <- renderInfoBox({
  
  combo <- combined_output()
  
  
  infoBox(strong("NON-VEGETARIAN"),
          width = 3,
          subtitle = "spent on meat",
          paste0("$",combo$share.df %>% 
                   filter(Type == "non-veg") %>% 
                   select(Total) %>% 
                   .[["Total"]]
          ),
          icon = icon("glass","fa-2x"),
          color = "fuchsia",
          fill = TRUE
  )
  
})