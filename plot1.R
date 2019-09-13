
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

#hist(dta2$Global_active_power, xlab = "Global Active Power",
#		 col = "red", main = "Global Active Power")

png(paste0(pth, "plot1.png"), height = 480, width = 480)

hist(dta2$Global_active_power, xlab = "Global Active Power",
		 col = "red", main = "Global Active Power")

dev.off()








