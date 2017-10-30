output$eggboxshare <- renderInfoBox({
  
  combo <- combined_output()
  
  infoBox(strong("EGGETARIAN SHARE"),
          width = 3,
          subtitle = "per person",
          paste0("$",combo$share.df %>%
                   filter(Type %in% c("egg","veg")) %>%
                   summarise(tot = sum(Share)) %>%
                   .[["tot"]]
          ),
          icon = icon("shopping-cart","fa-2x"),
          color = "blue",
          fill = TRUE
  )
  
})

output$vegboxshare <- renderInfoBox({
  
  combo <- combined_output()
  
  infoBox(strong("VEGETARIAN SHARE"),
          width = 3,
          subtitle = "per person",
          paste0("$",combo$share.df %>%
                   filter(Type %in% c("egg","veg")) %>%
                   summarise(tot = sum(Share)) %>%
                   .[["tot"]]
          ),
          icon = icon("shopping-cart","fa-2x"),
          color = "olive",
          fill = TRUE
  )
  
})

output$nonvegboxshare <- renderInfoBox({
  
  combo <- combined_output()
  
  
  infoBox(strong("NON-VEGETARIAN SHARE"),
          width = 3,
          subtitle = "per person",
          paste0("$",combo$share.df %>%
                   summarise(tot = sum(Share)) %>%
                   .[["tot"]]
          ),
          icon = icon("shopping-cart","fa-2x"),
          color = "maroon",
          fill = TRUE
  )
  
})