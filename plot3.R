  x <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

  x$y <- strptime(paste(x$Date, x$Time), format= "%d/%m/%Y %H:%M:%S", tz="UTC")

  s <- strptime("01/02/2007 00:00:00", format= "%d/%m/%Y %H:%M:%S", tz="UTC")

  e <- strptime("02/02/2007 23:59:59", format= "%d/%m/%Y %H:%M:%S", tz="UTC")

  data <- x[x$y >= s  &  x$y <= e, ]




  png(filename = "plot3.png", width=480, height=480)

  plot(data$y, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

  lines(data$y, data$Sub_metering_2, col="red")

  lines(data$y, data$Sub_metering_3, col="blue")

  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=par("lwd"))

  dev.off()
