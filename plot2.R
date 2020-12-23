
library("data.table")

##Read data
powerdata <- data.table::fread("household_power_consumption.txt",na.strings = "?")


# Change Data column to Data type
powerdata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter for dates 2007-02-01 and 2007-02-02
powerdata <- powerdata[(dateTime >= "2007-02-01" & (dateTime <= "2007-02-03"))]

png("plot2.png", width=480, height=480)

#Plot 2
plot(x = powerdata[, dateTime]
     , y = powerdata[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()