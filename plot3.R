#plot3.R
library(dplyr)
library(lubridate)

#read data in
entirefile <- read.table("./ExplorDataAnalys/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                         colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#get subset of data for two days only 
twodays <- filter(entirefile, Date == "1/2/2007" | Date == "2/2/2007")

#combine Date and Time columns
DTDF <- within(twodays, DateTime <- paste(Date, Time, sep=" "))
DTDF <- select(DTDF, -(Date:Time))

#change DateTime class to POSIXct
DTDF$DateTime <- dmy_hms(DTDF$DateTime)

#plot data
plot(DTDF$DateTime, DTDF$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(DTDF$DateTime, DTDF$Sub_metering_2, type="l", col="red")
points(DTDF$DateTime, DTDF$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), lty=(1))

#copy plot and create png file
dev.copy(png, file="./plot3.png", width = 480, height = 480)
dev.off()
