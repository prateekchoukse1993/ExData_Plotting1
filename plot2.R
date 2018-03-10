library(readr)
#reading data
data_hpc <- read_delim("C:/Users/PrateekChoukse/Desktop/MS BAPM/Semester 2/Data Science with Python/Data Science - John Hopkins University - Coursera/Data Explorartory Analysis/Week 1/household_power_consumption.txt", 
                       ";", escape_double = FALSE, trim_ws = TRUE)
#A quick glance at data
head(data_hpc)

#Conversions and plotting
FullTimeDate <- strptime(paste(data_hpc$Date,data_hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data_hpc <- cbind(data_hpc, FullTimeDate)
data_hpc$Date <- as.Date(data_hpc$Date, format="%d/%m/%Y")
data <- subset(data_hpc, Date == "2007-02-01" | Date =="2007-02-02")
with(data, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))

#Copying to png
dev.copy(png,"plot2.png")
dev.off()