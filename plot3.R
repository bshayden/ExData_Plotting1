consumption <- read.table("household_power_consumption.txt", header=TRUE, 
    sep=";", na.strings="?", nrows=1000000, stringsAsFactors=TRUE)
datetime <- paste(consumption$Date,consumption$Time, sep = " ")
consumption$Time <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
consumption$Date <- as.Date(consumption$Date,"%d/%m/%Y")
days <- subset(consumption, consumption$Date == "2007-02-02" | 
    consumption$Date == "2007-02-01")
png("plot3.png")
plot(days$Time, days$Sub_metering_1, type="n", 
    ylab = "Energy sub metering", xlab = "")
lines(days$Time, days$Sub_metering_1, col="black")
lines(days$Time, days$Sub_metering_2, col="red")
lines(days$Time, days$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    col=c("black", "red", "blue"), lty=7)
dev.off()