setwd("~/projects/coursera/data_science/04-exdata-035")
fileName = "household_power_consumption.txt"
# grep "^12/2/2007" household_power_consumption.txt -n -m 1
# 66638
# grep "^[12]/2/2007" household_power_consumption.txt | wc -l
# 2880
dataHeader = read.csv2(fileName, nrows = 1, header = F, sep =';', stringsAsFactors = FALSE)
dataTable = read.csv2(fileName, skip = 66637, nrow = 2880, sep = ";", stringsAsFactors = F, dec=".")
colnames(dataTable) = dataHeader
Sys.setlocale("LC_TIME", "en_US.UTF-8")
dataTable$Date = as.Date(dataTable$Date, format="%d/%m/%Y")
dataTable$Timestamp = strptime(paste(dataTable$Date, dataTable$Time), "%Y-%m-%d %H:%M:%S")
plot(dataTable$Timestamp, dataTable$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
