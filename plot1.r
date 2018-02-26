##############################################
#
#	Title:		Plotting a histogram of Global Active Power Consumption
#	Author:		Kalyan
#	Platform:	R(3.4.3) x86_64-w64-mingw32/x64 (64-bit)
#	Date:		26 February 2018
#	
#	Description: 
#	- Reads the text file downloaded from  UC Irvine Machine Learning Repository
#	- Takes two dates into account
#	- Makes a histogram for Glabal Active Power
#
##############################################

# Reference:
# V1	Date 
# V2	Time
# V3	Global_active_power
# V4	Global_reactive_power
# V5	Voltage
# V6	Global_intensity
# V7	Sub_metering_1
# V8	Sub_metering_2
# V9	Sub_metering_3

#Read and subset the required data
ds <- read.table("household_power_consumption.txt", colClasses = c("character", "character", rep("numeric", 7)), skip = 1, sep = ';', na.strings = '?')
reqDate <- (ds$V1 == "1/2/2007") | (ds$V1 == "2/2/2007")
ds <- ds[reqDate, ]

#Create a png and draw the histogram
png("plot1.png")
hist(ds$V3, col = "skyblue1", xlab = "Global Active Power (kWatts)", main = "Global Active Power Hist")
dev.off()