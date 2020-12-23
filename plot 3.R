
library("data.table")

##Read data
powerdata <- data.table::fread("household_power_consumption.txt",na.strings = "?")

# Change Data column to Data type
powerdata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter for dates 2007-02-01 and 2007-02-02
powerdata <- powerdata[(dateTime >= "2007-02-01" & (dateTime < "2007-02-03"))]

png("plot3.png", width=480, height=480)

#Plot 3
plot(powerdata[, dateTime], powerdata[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerdata[, dateTime], powerdata[, Sub_metering_2],col="red")
lines(powerdata[, dateTime], powerdata[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()