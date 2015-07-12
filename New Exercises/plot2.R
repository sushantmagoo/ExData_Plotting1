power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

DateTime <- paste(power$Date, power$Time)

power$DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

Day1 <- strptime("01/02/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

Day2 <- strptime("02/02/2007 23:59:59", format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

TwoDayData <- power[power$DateTime >= Day1  &  power$DateTime <= Day2, ]


png(filename = "plot2.png", width = 480, height = 480)

plot(TwoDayData$DateTime, TwoDayData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()