
##Read data
powerdata <- data.table::fread("household_power_consumption.txt",na.strings = "?")


# Change Data column to Data type
powerdata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter for dates 2007-02-01 and 2007-02-02
powerdata <- powerdata[(date >= "2007-02-01" & (Date <= "2007-02-02"))]

png("plot1.png", width=480, height=480)

#Plot 1
hist(powerdata[, Global_active_power], main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.off()

