library(dplyr)

setwd("C:/Users/lil'ganwayne/Desktop/Expense_Calculator")
data.df <- read.csv2("abc.csv", sep = ",", header = TRUE)
#data.df <- read.xlsx2("Data.xlsx", sheetName = "Sheet1")

data.df$Price <- as.numeric(as.character(data.df$Price))
data.df$Date <- as.Date(as.character(data.df$Date), format = "%d/%m/%Y")


str(data.df)
test.df <- data.df %>%
  group_by(Type)  %>%
  summarise(total = sum(Price)) %>%
  mutate(share = case_when(.$Type == 'egg' ~ round(.$total/5,2),
                           .$Type == 'non-veg' ~ round(.$total/3,2),
                           .$Type == 'veg' ~ round(.$total/5,2))) 
  

# Contribution

cont.df <- data.frame(data.df %>%
  group_by(Name) %>%
  summarise(contribution = round(sum(Price),2)) %>%
  arrange(Name) )

#ram_row <- c("Ram",0.0)

#cont.df <- rbind(cont.df,ram_row)

# Share
share.df <- data.frame(Name = as.factor(c('Gaurav','Prachi','Tejas','Sid','Niket')),initial=0)
share.df %>%
  mutate(share = case_when(.$Name == 'Gaurav' ~ sum(test.df$share),
                           .$Name == 'Prachi' ~ sum(test.df[which(test.df$Type %in% c('veg','egg')),3]),
                           .$Name == 'Tejas' ~ sum(test.df$share),
                           .$Name == 'Sid' ~ sum(test.df$share),
                           .$Name == 'Niket' ~ sum(test.df[which(test.df$Type %in% c('veg','egg')),3]))) %>%
  select(Name,share) %>%
  left_join(cont.df) %>%
  mutate(diff = round((contribution - share),2)) 



share.df %>%
        summarise(sum(contribution))

####################################################################################################



setwd("C:/Users/lil'ganwayne/Desktop/Expense_Calculator")
data.df <- read.csv2("abc.csv", sep = ",", header = TRUE)
#data.df <- read.xlsx2("Data.xlsx", sheetName = "Sheet1")

data.df$Price <- as.numeric(as.character(data.df$Price))
data.df$Date <- as.Date(as.character(data.df$Date), format = "%d/%m/%Y")


str(data.df)
test.df <- data.df %>%
        group_by(Type)  %>%
        summarise(total = sum(Price)) %>%
        mutate(share = case_when(.$Type == 'egg' ~ round(.$total/4,2),
                                 .$Type == 'non-veg' ~ round(.$total/2,2),
                                 .$Type == 'veg' ~ round(.$total/4,2))) 


# Contribution

cont.df <- data.frame(data.df %>%
                              group_by(Name) %>%
                              summarise(contribution = round(sum(Price),2)) %>%
                              arrange(Name) )

#ram_row <- c("Ram",0.0)

#cont.df <- rbind(cont.df,ram_row)

# Share
share.df <- data.frame(Name = as.factor(c('Niket','Prachi','Tejas','Sid')),initial=0)
share.df %>%
        mutate(share = case_when(.$Name == 'Niket' ~ sum(test.df[which(test.df$Type %in% c('veg','egg')),3]),
                                 .$Name == 'Prachi' ~ sum(test.df[which(test.df$Type %in% c('veg','egg')),3]),
                                 .$Name == 'Tejas' ~ sum(test.df$share),
                                 #.$Name == 'Pappa' ~ sum(test.df$share),
                                 .$Name == 'Sid' ~ sum(test.df$share))) %>%
        select(Name,share) %>%
        left_join(cont.df) %>%
        mutate(diff = round((contribution - share),2)) 



share.df %>%
        summarise(sum(contribution))
