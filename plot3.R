## Intro

# Our overall goal here is simply to examine how household energy usage varies over a 2-day 
# period in February, 2007. 

# Code file includes code for 
# reading the data so that the plot can be fully reproduced. It must also includes the code 
# that creates the PNG file.

# This file uses the base plotting system.

## Loading the data 

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, destfile = "HHPowerConsumption.zip", method = "curl")
unzip("HHPowerConsumption.zip")
HHPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## convert the Date and Time variables to Date/Time classes in R 

HHPC$datetime <- paste(as.character(HHPC$Date),as.character(HHPC$Time))
HHPC$datetime <- strptime(HHPC$datetime, "%d/%m/%Y %H:%M:%S")

## subset data from the dates 2007-02-01 and 2007-02-02

HHPCs <- subset(HHPC, datetime>"2007-01-31 23:59:59" & datetime<"2007-02-03")
rm("HHPC")  # remove large data

## Making Plots 
# save plot to a PNG file with a width of 480 pixels and a height of 480 pixels.

# Plot 3 (plot3.R)

png(file = "plot3.png")

with(HHPCs, plot(datetime, Sub_metering_1, type = "l", 
                 ylab = "Energy sub metering", xlab = ""))
with(HHPCs, points(datetime, Sub_metering_2, col = "red", type = "l"))
with(HHPCs, points(datetime, Sub_metering_3, col = "blue", type = "l"))
legend("topright",col=c("black","red","blue"), legend = c("Sub_metering_1",
                                                          "Sub_metering_2","Sub_metering_3"), lty = 1)

dev.off()
