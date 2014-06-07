#
# Coursera - Exploratory Data Analysis - Course Project 1
# Fabio Covolo Mazzo - 06/05/2014
#
# This script reads a dataset from "household_power_comsumption.txt" and generates
# the plot1
makePlot1 <- function() {

  df_house <- read.csv2("household_power_consumption.txt",na.strings="?",stringsAsFactors = F) 
  
  df_house$Date <- as.Date(df_house$Date, format = "%d/%m/%Y")
  
  df_final <- df_house[(df_house$Date >= "2007-02-01") & (df_house$Date <= "2007-02-02"), ]
  
  df_final$Global_active_power <- as.numeric(df_final$Global_active_power)
 
 colors = c("red")
 
 png(file = "plot1.png", width = 480, height = 480)
 
 
  hist(df_final$Global_active_power,main="Global Active Power",
       xlab="Global Active Power (kilowatts)",col=colors)
  
 dev.off()
        
}
