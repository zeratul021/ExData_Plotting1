#Read the data from the selected dates 
# read.table("household_power_consumption.txt", nrow = 1, header = T, sep=";")
setwd("~/projects/coursera/data_science/04-exdata-035")
fileName = "household_power_consumption.txt"
# grep "^12/2/2007" household_power_consumption.txt -n -m 1
# 66638
# grep "^[12]/2/2007" household_power_consumption.txt | wc -l
# 2880
dataHeader = read.csv2(fileName, nrows = 1, header = F, sep =';', stringsAsFactors = FALSE)
dataTable = read.csv2(fileName, skip = 66637, nrow = 2880, sep = ";", stringsAsFactors = F, dec=".")
colnames(dataTable) = dataHeader
#dataTable$Global_active_power = as.numeric(dataTable$Global_active_power)
hist(dataTable$Global_active_power, col= "red", main= "Global Active Power", xlab= "Global Active Power (kilowatts)", ylab= "Frequency")
dev.copy(png, file="plot1.png", width=504, height=504)
dev.off()
