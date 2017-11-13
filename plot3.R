#plot3
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

# extract sub metering
sm1 = as.numeric(dfSubset$Sub_metering_1)
sm2 = as.numeric(dfSubset$Sub_metering_2)
sm3 = as.numeric(dfSubset$Sub_metering_3)

# create plot
png("plot3.png", width=480, height=480)
dateNum <- strptime(paste(dfSubset$Date, dfSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(dateNum, sm1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(dateNum, sm2, col="red", type="l")
lines(dateNum, sm3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()