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
#	- Plots Global Active Power for the two days
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

#Convert character date and time to Date object of POSIXct
ds$V2 <- as.POSIXct(strptime(paste(ds$V1, ds$V2), "%d/%m/%Y %H:%M:%S"))

#Create a png and plot the Global Actuve Power
png("plot2.png")
plot(ds$V2, ds$V3, "l", ylab = "Global Active Power(kWatts)", xlab = "Time", main = "Global Active Power for 2 days")
dev.off()