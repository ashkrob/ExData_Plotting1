#plot1.R
library(dplyr)

#read data in
entirefile <- read.table("./ExplorDataAnalys/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?",
                         colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#get subset of data for two days only 
twodays <- filter(entirefile, Date == "1/2/2007" | Date == "2/2/2007")

#plot data
hist(twodays$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#copy plot and create png file
dev.copy(png, file="./plot1.png", width = 480, height = 480)
dev.off()
