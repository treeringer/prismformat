#code to format stacked or long format monthly climate data to 12 column format

#try with PRISM stacked or long format downloaded from PRISM data viewer for a single point
#you will need to download a text file of climate data from https://prism.oregonstate.edu/explorer/
#delete the meta data in the top 10 rows in EXCEL so you have just data with headers
setwd("C:/Users/rmaxwell2/Desktop/work_r")
tmean <- read.table(file = "wolf_tmean_prism_long.csv", header = TRUE, sep = ",")
head(tmean)
year <- substr(tmean[,1], 1, 4) #pull year from date string using character positions
month <- substr(tmean[,1], 6, 7) #pull month from date string using character positions
tmean <- add_column(tmean, year = year, .after = 1) #add in year column
tmean <- add_column(tmean, month = month, .after = 2) #add in month column
tmean <- tmean[,2:4] #3 column data frame

date <- tmean[1:1500,3] #change to your number of rows
date.mat <- matrix(date, nrow =12) #create matrix with columns and rows
tdate <- t(date.mat) #transpose
year <- c(1895:2019) #create year column for your year range
date.monthly <- cbind(year, tdate) #combine variables into data frame
colnames(date.monthly) <- c("year", "jan", "feb", "march", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec") #set headers
head(date.monthly)
write.csv(date.monthly,file = "tmean_wolf_12.csv") #write to a file for later

#keep going if you want to remove the ID column in the .csv and set years as rows
head(date.monthly) #check it out
row.names(date.monthly) #check row names
row.names(date.monthly) <- year #set row names as year
date.monthly <- date.monthly[,2:13] #remove year column
head(date.monthly) #check it out
summary(date.monthly) #check it out
write.csv(date.monthly,file = "tmean_wolf_12.csv") #right to a file for later

#######################
#try with data that already behave
setwd("C:/Users/rmaxwell2/Desktop/work_r")
tmean <- read.table(file = "wolf_tmean_long.csv", header = TRUE, sep = ",")

date <- tmean[1:1500,3] #change to your number of rows
date.mat <- matrix(date, nrow =12) #create matrix
tdate <- t(date.mat) #transpose
year <- c(1895:2019) #create year column for your year range
date.monthly <- cbind(year, tdate) #combine variables into data frame
colnames(date.monthly) <- c("year", "jan", "feb", "march", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec") #set headers
head(date.monthly)
write.csv(date.monthly,file = "tmean_wolf_12.csv") #write to a file for later

#keep going if you want to remove the ID column in the .csv and set years as rows
head(date.monthly) #check it out
row.names(date.monthly) #check row names
row.names(date.monthly) <- year #set row names as year
date.monthly <- date.monthly[,2:13] #remove year column
head(date.monthly) #check it out
summary(date.monthly) #check it out
write.csv(date.monthly,file = "tmean_wolf_12.csv") #right to a file for later


