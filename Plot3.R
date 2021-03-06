# Exploratory Data Anlaysis - Assignment 1
## Submission by Akhilesh Sharma


### Downloading ZIP file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "household_power_consumption.zip")
datedownloaded <- date()


### Unzip downloaded file
unzip("household_power_consumption.zip", "household_power_consumption.txt")


### Read file
power <- read.table("household_power_consumption.txt", header = TRUE, 
                    stringsAsFactors = FALSE, sep = ';', na.strings = "?", dec = ".")


### Take subset of data between the dates 2007-02-01 and 2007-02-02
sub_power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]


### Define a new Date-Time column to plot graph with respect to dates
sub_power$DateTime <- strptime(paste(sub_power$Date, sub_power$Time), 
                               format = "%d/%m/%Y %H:%M:%S")
sub_power$DateTime <- as.POSIXct(sub_power$DateTime)


### Plot 3 - Energy Sub Metering vs Date
with(sub_power, {
        plot(Sub_metering_1 ~ DateTime, type = "l", xlab = "", 
             ylab = "Energy sub metering")
        lines(Sub_metering_2 ~ DateTime, col = "red")
        lines(Sub_metering_3 ~ DateTime, col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = 1, 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
