consumption <- read.table("household_power_consumption.txt", header=TRUE, 
    sep=";", na.strings="?", nrows=1000000, stringsAsFactors=TRUE)
datetime <- paste(consumption$Date,consumption$Time, sep = " ")
consumption$Time <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
consumption$Date <- as.Date(consumption$Date,"%d/%m/%Y")
days <- subset(consumption, consumption$Date == "2007-02-02" | 
    consumption$Date == "2007-02-01")
png("plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(days, {
  plot(Time, Global_active_power, type="n", 
       ylab = "Global Active Power", xlab = "")
  lines(Time, Global_active_power)
  plot(Time, Voltage, type="n", 
       ylab = "Voltage", xlab = "datetime")
  lines(Time, Voltage)
  plot(Time, Sub_metering_1, type="n", 
       ylab = "Energy sub metering", xlab = "")
  lines(Time, Sub_metering_1, col="black")
  lines(Time, Sub_metering_2, col="red")
  lines(Time, Sub_metering_3, col="blue")
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"), lty=7, bty="n")
  plot(Time, Global_reactive_power, type="n", 
       ylab = "Global_reactive_power", xlab = "datetime")
  lines(Time, Global_reactive_power)
})
dev.off()