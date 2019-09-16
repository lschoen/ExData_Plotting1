## Exploratory Data Analysis 
## Week 1 Assignment - PLOT 1

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
# comebine date and time to get a single variable, and convert to time format
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Plot 1
hist(data$Global_active_power, main="Global Active Power", freq = TRUE, col = "red", 
                ylim = c(0,1200), xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

