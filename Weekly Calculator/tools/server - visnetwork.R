output$network <- renderVisNetwork({
  
  combo <- combined_output()
  
  visNetwork(combo$nodes, 
             combo$edges, 
             width = "100%") %>%
    visNodes(borderWidth = 3, 
             labelHighlightBold = TRUE,
             shadow = list(enabled = TRUE, 
                           size = 50)) %>%
    visEdges(arrows ="to", 
             color = "darkred", length = 5,
             width = 2, 
             dashes = TRUE) %>% 
    visOptions(highlightNearest = TRUE) %>%
    visInteraction(hover = TRUE,
                   dragNodes = FALSE, 
                   dragView = FALSE, 
                   zoomView = FALSE) %>%
    visHierarchicalLayout(direction = "LR")
  
  
})


