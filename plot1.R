#plot1
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

# create hist
png("plot1.png", width=480, height=480)
hist(as.numeric(dfSubset$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()