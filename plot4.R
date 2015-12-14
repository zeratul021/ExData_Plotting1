setwd("~/projects/coursera/data_science/04-exdata-035")
fileName = "household_power_consumption.txt"
# grep "^12/2/2007" household_power_consumption.txt -n -m 1
# 66638
# grep "^[12]/2/2007" household_power_consumption.txt | wc -l
# 2880
dataHeader = read.csv2(fileName, nrows = 1, header = F, sep = ";", stringsAsFactors = F)
dataTable = read.csv2(fileName, skip = 66637, nrow = 2880, sep = ";", stringsAsFactors = F, dec = ".")
colnames(dataTable) = dataHeader
# prepare dates
Sys.setlocale("LC_TIME", "en_US.UTF-8")
dataTable$Date = as.Date(dataTable$Date, format="%d/%m/%Y")
dataTable$Timestamp = strptime(paste(dataTable$Date, dataTable$Time), "%Y-%m-%d %H:%M:%S")
# creat 2x2 image plot
#png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
# add charts
plot(dataTable$Timestamp, dataTable$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(dataTable$Timestamp, dataTable$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dataTable$Timestamp, dataTable$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(dataTable$Timestamp, dataTable$Sub_metering_2, type="l", col="red")
lines(dataTable$Timestamp, dataTable$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(dataTable$Timestamp, dataTable$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
