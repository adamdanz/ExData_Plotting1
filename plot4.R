#plot4
# For Coursera > Exploratory data analysis > Week 1 > project
# Danz 171112

#Clean up shop
rm(list=ls())               #remove all vars
cat("\014")                 #clear console

# Set working dir
setwd("C:\\Users\\adanz\\Dropbox\\Danz Cloud\\classwork\\Data Science - Coursera\\4 Exploratory data analysis\\week 1\\project\\ExData_Plotting1")

# Read data 
df <- read.table("C:\\Users\\adanz\\Dropbox\\Danz Cloud\\classwork\\Data Science - Coursera\\4 Exploratory data analysis\\week 1\\project\\household_power_consumption.txt", 
                 header=TRUE, sep = ';', stringsAsFactors=FALSE, dec=".")
# extract data for 2 days 
dfSubset <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
# format dates
dateNum <- strptime(paste(dfSubset$Date, dfSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# extract sub metering
sm1 = as.numeric(dfSubset$Sub_metering_1)
sm2 = as.numeric(dfSubset$Sub_metering_2)
sm3 = as.numeric(dfSubset$Sub_metering_3)

# create plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#plot(1,1)
plot(dateNum, as.numeric(dfSubset$Global_active_power), type="l", xlab="", ylab="Global Active Power") 
#plot(1,2)
plot(dateNum, as.numeric(dfSubset$Voltage), type="l", xlab="datetime", ylab="Voltage")
#plot(2,1)
plot(dateNum, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dateNum, sm2, type="l", col="red")
lines(dateNum, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#plot(2,2)
plot(dateNum, as.numeric(dfSubset$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()