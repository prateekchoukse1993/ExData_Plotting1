library(readr)
#reading data
data_hpc <- read_delim("C:/Users/PrateekChoukse/Desktop/MS BAPM/Semester 2/Data Science with Python/Data Science - John Hopkins University - Coursera/Data Explorartory Analysis/Week 1/household_power_consumption.txt", 
                                               ";", escape_double = FALSE, trim_ws = TRUE)
#A quick glance at data
head(data_hpc)

#Converting Date column to Date class
#The default format is yyyy-mm-dd
data_hpc$Date <- as.Date(data_hpc$Date,"%d/%m/%Y")

#Extracting values for 1st and 2nd Feb, 2007
data <- subset(data_hpc,(Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))

#Plotting
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Copying to png
dev.copy(png,"plot1.png")
dev.off()
