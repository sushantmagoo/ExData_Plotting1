  x<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

  x$Date <- as.Date(x$Date, format="%d/%m/%Y")

  s <- as.Date("01/02/2007", format="%d/%m/%Y")

  e <- as.Date("02/02/2007", format="%d/%m/%Y")

  data <- x[x$Date >= s & x$Date <= e, ]




  png(filename="plot1.png", width=480, height=480)

  hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

  dev.off()
