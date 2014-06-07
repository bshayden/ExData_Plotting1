consumption <- read.table("household_power_consumption.txt", header=TRUE, 
    sep=";", na.strings="?", nrows=1000000, stringsAsFactors=TRUE)
consumption$Date <- as.Date(consumption$Date,"%d/%m/%Y")
days <- subset(consumption, consumption$Date == "2007-02-02" | 
    consumption$Date == "2007-02-01")
png("plot1.png")
hist(days$Global_active_power, col="red", main="Global Active Power", 
    xlab = "Global Active Power (kilowatts)")
dev.off()