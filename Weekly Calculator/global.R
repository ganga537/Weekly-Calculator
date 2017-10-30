# Load Required Packages
library(shiny)
library(shinydashboard)
library(dplyr)
library(tidyverse)
library(DT)
library(highcharter)
library(stringr)
library(visNetwork)

# Load File paths
dir.home <- "F:/Weekly Calculator"
dir.raw <- "/Raw_Data/"
dir.consolidate <- "/Consolidation_Script/Consolidated_Data"
dir.tools <- "/tools"

# Create Vector of RData file names

details = file.info(list.files(file.path(paste0(".",dir.consolidate))))
details = details[with(details, order(as.POSIXct(mtime))), ]
files = rownames(details)
#files.vt <- sub("*._","",sort(str_replace_all(files,".RData",""), decreasing = TRUE))
files.vt <- sort(str_replace_all(files,".RData",""), decreasing = TRUE)

### ui components 
# source(file.path(paste0(dir.home,dir.tools), "ui - sidebar.R"))
# source(file.path(paste0(dir.home,dir.tools), "ui - infobox.R"))
# source(file.path(paste0(dir.home,dir.tools), "ui - DT - contribution.R"))
# source(file.path(paste0(dir.home,dir.tools), "ui - raw - data.R"))

source(file.path(paste0(".",dir.tools), "ui - sidebar.R"))
source(file.path(paste0(".",dir.tools), "ui - infobox.R"))
source(file.path(paste0(".",dir.tools), "ui - infobox - share.R"))
source(file.path(paste0(".",dir.tools), "ui - DT - contribution.R"))
source(file.path(paste0(".",dir.tools), "ui - highcharter.R"))
source(file.path(paste0(".",dir.tools), "ui - raw - data.R"))
