power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

DateTime <- paste(power$Date, power$Time)

power$DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

Day1 <- strptime("01/02/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

Day2 <- strptime("02/02/2007 23:59:59", format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

TwoDayData <- power[power$DateTime >= Day1  &  power$DateTime <= Day2, ]


png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))

plot(TwoDayData$DateTime, TwoDayData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(TwoDayData$DateTime, TwoDayData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(TwoDayData$DateTime, TwoDayData$Sub_metering_2, col = "red")

lines(TwoDayData$DateTime, TwoDayData$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = par("lwd"), bty = "n")

plot(TwoDayData$DateTime, TwoDayData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(TwoDayData$DateTime, TwoDayData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
