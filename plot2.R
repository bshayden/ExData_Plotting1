consumption <- read.table("household_power_consumption.txt", header=TRUE, 
    sep=";", na.strings="?", nrows=1000000, stringsAsFactors=TRUE)
datetime <- paste(consumption$Date,consumption$Time, sep = " ")
consumption$Time <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
consumption$Date <- as.Date(consumption$Date,"%d/%m/%Y")
days <- subset(consumption, consumption$Date == "2007-02-02" | 
    consumption$Date == "2007-02-01")
png("plot2.png")
plot(days$Time, days$Global_active_power, type="n", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
lines(days$Time, days$Global_active_power)
dev.off()