## Exploratory Data Analysis 
## Week 1 Assignment - PLOT 4

# Download, unzip and load the data into R, format the date, and subset:
DataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(DataURL, destfile = "./dataset.zip", method = "curl")
unzip("./dataset.zip", junkpaths = TRUE)
data_full <- read.csv("./household_power_consumption.txt",
                      sep = ';',
                      dec = '.',
                      na.strings = "?", 
                      stringsAsFactors = FALSE)

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# combine date and time to get a single variable, and convert to time format
data$DateTime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(data$DateTime)

# Plot 4
par(mfcol = c(2,2))

#top left plot
plot(data$Global_active_power~data$DateTime, type="l",
     ylab="Global Active Power", xlab="")

# lower left plot
plot(data$Sub_metering_1~data$DateTime, type="l",
     ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$DateTime, type = "l", col="red")
lines(data$Sub_metering_3~data$DateTime, type = "l", col="blue")
legend("topright", lty = 1, box.lty=0, cex = 0.8, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#top right plot
with(data, plot(DateTime, Voltage, type="l"))

#lower right plot
with(data, plot(DateTime, Global_reactive_power, type="l"))


# output plot to file
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
