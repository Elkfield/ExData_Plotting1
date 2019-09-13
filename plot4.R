
# r script for explanatory data anaylsis

# load the data
library(data.table)
library(tidyverse)

pth <- "D:/Online Courses/Coursera/Data Science Specialization/Explanatory Data Analysis/"

dta <- fread(paste0(pth, "household_power_consumption.txt"), data.table = FALSE, stringsAsFactors = FALSE,
						 na.strings = "?")

dta$Date <- as.Date(dta$Date, "%d/%m/%Y")

# filter the data for the dates in focus:
dta %>%
	filter(Date %in% as.Date(c("1/2/2007", "2/2/2007"), "%d/%m/%Y")) ->
	dta2

dta2$time_new <- as.POSIXct(paste0(dta2$Date, " ", dta2$Time), tz = "GMT")

#plot(x = dta2$time_new,y = dta2$Global_active_power, type = "l",
#		 xlab = "", ylab = "Global Active Power (kilowatts)")

png(paste0(pth, "plot4.png"), height = 480, width = 480)

par(mfrow = c(2, 2))

# plot 1
plot(x = dta2$time_new,y = dta2$Global_active_power, type = "l",
		 xlab = "", ylab = "Global Active Power")

# plot 2
plot(x = dta2$time_new,y = dta2$Voltage, type = "l",
		 xlab = "datetime", ylab = "Voltage")

# plot 3
plot(x = dta2$time_new,y = dta2$Sub_metering_1, type = "l", 
		 xlab = "", ylab = "Energy sub metering")
lines(x = dta2$time_new,y = dta2$Sub_metering_2, type = "l", col = "red")
lines(x = dta2$time_new,y = dta2$Sub_metering_3, type = "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
			 legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 4
plot(x = dta2$time_new,y = dta2$Global_reactive_power, type = "l",
		 xlab = "datetime", ylab = "Global_reactive_power ")

dev.off()








