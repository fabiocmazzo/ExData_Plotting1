#
# Coursera - Exploratory Data Analysis - Course Project 1
# Fabio Covolo Mazzo - 06/05/2014
#
# This script reads a dataset from "household_power_comsumption.txt" and generates
# the plot4
makePlot4 <- function() {
        
  Sys.setlocale("LC_TIME", "en_US.UTF-8")

  df_house <- read.csv2("household_power_consumption.txt",na.strings="?",stringsAsFactors = F) 
  

  df_house$DateTime <- strptime(paste(df_house$Date, df_house$Time), format ="%d/%m/%Y %H:%M:%S")
  df_house$Date <- as.Date(df_house$Date, format = "%d/%m/%Y")
  
  df_final <- df_house[(df_house$Date >= "2007-02-01") & (df_house$Date <= "2007-02-02"), ]
  
  df_final$Sub_metering_1 <- as.numeric(df_final$Sub_metering_1)
  df_final$Sub_metering_2 <- as.numeric(df_final$Sub_metering_2)
  df_final$Sub_metering_3 <- as.numeric(df_final$Sub_metering_3)
  df_final$Voltage <-        as.numeric(df_final$Voltage)
  df_final$Global_active_power <-        as.numeric(df_final$Global_active_power)
  df_final$Global_reactive_power <-      as.numeric(df_final$Global_reactive_power)
 
  
  
  png(file = "plot4.png", width = 480, height = 480)
  
  par(mfrow=c(2,2))
  
  plot(df_final$DateTime,df_final$Global_active_power,col="black", type="l",
       ylab="Global Active Power(kilowats)",
       xlab="")
  
  plot(df_final$DateTime,df_final$Voltage,col="black", type="l",
       ylab="Voltage",
       xlab="datetime")
  
  plot(df_final$DateTime,c(df_final$Sub_metering_1),col="black", type="l",
       ylab="Energy sub metering",
       xlab="")
  
  lines(df_final$DateTime,df_final$Sub_metering_2, col="red")
  
  lines(df_final$DateTime,df_final$Sub_metering_3, col="blue")

  legend("topright",  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                      col=c("black","red","blue"),lty=c(1,1), bty = "n")
  
  plot(df_final$DateTime,df_final$Global_reactive_power,col="black", type="l",
       ylab="Global_reactive_power",
       xlab="datetime")
 
  
  
 dev.off()
        
}
