output$item_spending <- renderHighchart({
  
  combo <- combined_output()
  
  plot.df <- combo$raw_data.df %>%
    filter(Item != "Others") %>%
    group_by(Item) %>%
    summarise(Spending = sum(Amount),
              Quantity = n()) %>%
    arrange(Spending)
  
  hc <- plot.df %>%
    hchart("column", 
           hcaes(x=Item, 
                 y = Spending),
           color = '#FF3333'
    ) %>%
    hc_title(text = "Weekly Spending") %>%
    hc_subtitle(text = "by Items",style = list(fontWeight = "bold")) %>%
    hc_yAxis( 
      minorGridLineWidth = 0, gridLineWidth = 0,
      plotBands = list(
        list(from = 10, to = 20, color = "rgba(50, 205, 50, 0.3)",
             label = list(text = "A low band")),
        list(from = 20, to = 50, color = "rgba(255, 153, 0, 0.3)",
             label = list(text = "A medium band")),
        list(from = 50, to = 250, color = "rgba(255, 0, 0, 0.3)",
             label = list(text = "A high band"))
      ),
      labels = list(format = paste0("$","{value}"))) %>%
    hc_tooltip(crosshairs = TRUE, shared = TRUE,
               
               #pointFormat = paste0('<span style="font-size: 20px"> ${point.y}', '</span>')
               pointFormat = paste0('Amount = ${point.y} <br> Quantity = {point.Quantity}')
    )
  
  hc
  
})
