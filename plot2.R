# create a plot that mimics the following
# https://github.com/nxhuynh/ExData_Plotting1/blob/master/figure/unnamed-chunk-3.png

data <- read.table("household_power_consumption.txt",
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
d <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
d$Time <- strptime(paste(d$Date, d$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
#d$Date <- weekdays(d$Date, TRUE)
png("plot2.png")
plot(d$Time, d$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()