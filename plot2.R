## Exploratory Data Analysis 
## Week 1 Assignment - PLOT 2

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

# Plot 2
plot(data$Global_active_power~data$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

