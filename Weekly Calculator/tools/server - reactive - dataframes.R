combined_output <- reactive({load( file = file.path(paste0(".",dir.consolidate,"/",
                                                           input$selweek,".RData")
)
)
  combo <- list(buyers.df  = buyers.df,
                owes.df = owes.df,
                raw_data.df = raw_data.df,
                share.df = share.df,
                nodes.df = nodes.df,
                edges.df = edges.df
                
  )
  combo
}) 