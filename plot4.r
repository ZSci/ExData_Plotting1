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
#	- Plots 4 differernt graphs in one window, column wise
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

#Create a png and plot 4 different graphs entered column-wise into one window
png("plot4.png")
par(mfcol = c(2, 2))

#plot 1
plot(ds$V2, ds$V3, "l", ylab = "Global Active Power(kWatts)", xlab = "Time", main = "Global Active Power for 2 days")

#plot 2
plot(ds$V2, ds$V7, "l", ylab = "Energy Sub Metering", xlab = "Time", main = "Energy Sub Metering for 2 days")
lines(ds$V2, ds$V8, col = "red")
lines(ds$V2, ds$V9, col = "green")
legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "green"), lty = c(1, 1, 1), pch = "")

#plot 3
plot(ds$V2, ds$V5, "l", ylab = "Voltage", xlab = "Time", main = "Voltage for 2 days")

#plot 4
plot(ds$V2, ds$V4, "l", ylab = "Global Reactive Power", xlab = "Time", main = "Global Reactive Power for 2 days")
dev.off()