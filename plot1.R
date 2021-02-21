## Course project 1: Plot 1

# Downloading data
data <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")

# Subsetting data with needed dates
subset <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

# Formatting date and time by changing the class of Date variable from character to Date:
subset$Date <- as.Date(subset$Date, format = "%d/%m/%Y")

# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
subset$DateTime <- as.POSIXct(paste(subset$Date, subset$Time))

# Creating plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(subset$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()