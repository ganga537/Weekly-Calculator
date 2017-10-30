# Load required library
library(tidyverse)
library(visNetwork)
library(stringr)

# Load File paths
#dir.home <- "F:/Weekly Calculator"
dir.raw <- "/Raw_Data/"
dir.consolidate <- "/Consolidation_Script/Consolidated_Data"

# To get name of latest raw file name in the directory
details = file.info(list.files(file.path(paste0(".",dir.raw)),pattern="*.csv",full.names = TRUE))
details = details[with(details, order(as.POSIXct(mtime))), ]
files = rownames(details)
raw_file_name = files[length(files)]


# Read data File
raw_data.df <- read_delim(raw_file_name,
                          delim = ",",
                          col_types = cols(
                          Date = col_date("%d/%m/%Y"),
                          Item = col_character(),
                          Amount = col_double(),
                          Type = col_character(),
                          Buyer = col_character())
                          )
# Share by Type of Food

type_of_food.vt <- c("egg","veg","non-veg")

share.df <- raw_data.df %>%
  group_by(Type)  %>%
  summarise(Total = sum(Amount)) %>%
  mutate(Share = case_when(.$Type == 'egg' ~ round(.$Total/5,2),
                           .$Type == 'non-veg' ~ round(.$Total/3,2),
                           .$Type == 'veg' ~ round(.$Total/5,2))) 

if(length(unique(share.df$Type)) < 3) {
share.df <- suppressWarnings(share.df %>%
                               bind_rows(data.frame(Type = type_of_food.vt[!type_of_food.vt %in% share.df$Type],
                                                    Total = as.numeric(0,0),
                                                    Share = as.numeric(0,0))
                                         )
                             ) 
}

# Contribution by Type of Food
contribution.df <- raw_data.df %>%
  group_by(Buyer) %>%
  summarise(Contribution = round(sum(Amount),2)) %>%
  arrange(desc(Contribution))

# Combine Share and Contribution together

# Share
buyers.df <- data.frame(Buyer = as.character(c('Gaurav','Prachi','Tejas','Sid','Niket')),initial=0)
suppressWarnings(buyers.df %<>%
                   mutate(Share = case_when(.$Buyer == 'Gaurav' ~ sum(share.df$Share),
                                            .$Buyer == 'Prachi' ~ sum(share.df[which(share.df$Type %in% c('veg','egg')),3]),
                                            .$Buyer == 'Tejas' ~ sum(share.df$Share),
                                            .$Buyer == 'Sid' ~ sum(share.df$Share),
                                            .$Buyer == 'Niket' ~ sum(share.df[which(share.df$Type %in% c('veg','egg')),3]))) %>%
                   select(Buyer,Share) %>%
                   left_join(contribution.df) %>%
                   mutate(Difference = round((Contribution - Share),2)) %>%
                   arrange(desc(Difference))) 

# Code that prints who owes who
test <- buyers.df %>% select(Buyer,Difference)
owes.vt <- c()

for (i in 1 : nrow(test)) {
  
  if(test$Difference[1] + test$Difference[nrow(test)] > 0) {
    
    test[1,] <- c(test[1,1],as.numeric(test$Difference[1] + test$Difference[nrow(test)]))
    owes.vt[i] <- paste0(test$Buyer[nrow(test)], " owes ", test$Buyer[1], " $",-(round(as.numeric(test$Difference[nrow(test)]),2)))
    test <- test[-nrow(test),]
    test$Difference <- as.numeric(test$Difference)
    
    
    
  }  else {
    
    test[nrow(test),] <- c(test[nrow(test),1],as.numeric(test$Difference[1] + test$Difference[nrow(test)]))
    owes.vt[i] <- paste0(test$Buyer[nrow(test)], " owes ", test$Buyer[1], " $",round(as.numeric(test$Difference[1]),2))
    test <- test[-1,]
    test$Difference <- as.numeric(test$Difference)
  
    
  }
  
}

owes.vt <- owes.vt[-length(owes.vt)]
     
owes.df <- as.data.frame(owes.vt)    
colnames(owes.df)[1] <- "Who owes Who"

# For VisNetwork Visualisation

nodes.df <- data.frame(id = c("Gaurav","Tejas","Niket","Prachi","Sid"), 
                    shape = c("square"))

edges.df <- data.frame(from = word(owes.df[,1], 1), 
                    to = word(owes.df[,1], 3), 
                    length = as.numeric(gsub("\\$","",word(owes.df[,1], 4))),
                    label = word(owes.df[,1], 4)
)

edges.df$title <- paste0(edges.df$from," -> " ,edges.df$to," <br> Owes : ",edges.df$label)


# Save data frames used by dashboard as .RData file

save(
  buyers.df, 
  owes.df, 
  raw_data.df,
  share.df,
  nodes.df,
  edges.df,
  file = file.path(paste0(".",dir.consolidate), paste0("5_",format.Date(Sys.Date()-7,"%d-%b-%Y"),"_to_",format.Date(Sys.Date()-1,"%d-%b-%Y"),".RData"))
  #file = file.path(paste0(dir.home,dir.consolidate), paste0(format.Date(Sys.Date()-26,"%d%m%Y"),"_to_",format.Date(Sys.Date()-20,"%d%m%Y"),".RData"))
)

#   
# load( file = file.path(paste0(dir.home,dir.consolidate,"/",
#                               "24092017_to_02102017.RData")))
                       
                       
