# create a plot that mimics the following
# https://github.com/nxhuynh/ExData_Plotting1/blob/master/figure/unnamed-chunk-5.png

data <- read.table("household_power_consumption.txt",
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
d <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
d$Time <- strptime(paste(d$Date, d$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2))
# top left
plot(d$Time, d$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# top right
plot(d$Time, d$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# bottom left
plot(d$Time, d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(d$Time, d$Sub_metering_2, type="l", col="red")
points(d$Time, d$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, legend=names(d)[7:9], col=c("black","red","blue"), bty="n")
# bottom right
plot(d$Time, d$Global_reactive_power, type="l", xlab="datetime")
dev.off()