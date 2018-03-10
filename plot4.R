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

#Extracting values for 1st and 2nd Feb, 2007
data <- subset(data_hpc, Date == "2007-02-01" | Date =="2007-02-02")

#Plotting
par(mfrow = c(2,2))

#Plot (1,1)
with(data, plot(FullTimeDate, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

#Plot (1,2)
with(data, plot(FullTimeDate, Voltage, type="l", xlab="datetime", ylab="Voltage"))

#Plot (2,1)
with(data,{
  plot(FullTimeDate, Sub_metering_1, type="l", ylab="Energy sub metering")
  lines(FullTimeDate, Sub_metering_2, col = "red")
  lines(FullTimeDate, Sub_metering_3, col = "blue")
})
legend("topright",col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

#Plot (2,2)
with(data, plot(FullTimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

#Copying to png
dev.copy(png,"plot4.png")
dev.off()
