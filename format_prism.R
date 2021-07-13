#code to format stacked or long format monthly climate data to 12 column format

#try with PRISM stacked or long format downloaded from PRISM data viewer for a single point
#you will need to download a csv file of climate data from https://prism.oregonstate.edu/explorer/

setwd("C:/Users/rmaxwell2/Desktop/work_r") #set your working directory
install.packages(tidyverse)
library(tidyverse)
data <- read.table(file = "wolf_tmean_prism_original.csv", skip = 10, header = TRUE, sep = ",") #skips reading the header
head(data)
year <- substr(data[,1], 1, 4) #pull year from date string using character positions
month <- substr(data[,1], 6, 7) #pull month from date string using character positions
data <- add_column(data, year = year, .after = 1) #add in year column
data <- add_column(data, month = month, .after = 2) #add in month column
data <- data[,2:4] #3 column data frame
colnames(data) <- c("year","month", "climate") #rename columns
data <- as.data.frame(data) #make it a data frame
data$month <- as.factor(data$month) #set variable type
data$year <- as.numeric(data$year) #set variable type
x <- pivot_wider(data, names_from = month, values_from = climate) #transform data format
write.csv(x,file = "tmean_wolf_12.csv") #write to a file for later
#the end