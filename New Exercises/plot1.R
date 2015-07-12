power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

Day1 <- as.Date("01/02/2007", format = "%d/%m/%Y")

Day2 <- as.Date("02/02/2007", format = "%d/%m/%Y")

TwoDayData <- power[power$Date >= Day1 & power$Date <= Day2, ]


png(filename = "plot1.png", width = 480, height = 480)

hist(TwoDayData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()