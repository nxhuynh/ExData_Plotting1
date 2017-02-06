# create a plot that mimics the following
# https://github.com/nxhuynh/ExData_Plotting1/blob/master/figure/unnamed-chunk-2.png

data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
d <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
png("plot1.png")
hist(d$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()