
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

png(paste0(pth, "plot2.png"), height = 480, width = 480)

plot(x = dta2$time_new,y = dta2$Global_active_power, type = "l",
		 xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()








