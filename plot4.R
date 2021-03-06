## Course project 1: Plot 4

# Downloading data
data <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";")
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3")

# Subsetting data with needed dates
subset <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

# Formatting date and time by changing the class of Date variable from character to Date:
subset$Date <- as.Date(subset$Date, format = "%d/%m/%Y")

# Combining the Date and Time variable and creating a new column in dataset named "DateTime"
subset$DateTime <- as.POSIXct(paste(subset$Date, subset$Time))

## Creating plot4:
png("plot4.png", width = 480, height = 480)

# Setting parameters for 2x2 plot, filling columns first
par(mfcol = c(2,2))

# plot top left = plot 2
plot(subset$DateTime, subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

# plot bottom left = plot 3
plot(subset$DateTime, subset$Sub_metering_1, type= "l", col = "black", xlab = "", ylab= "Energy sub metering")
points(subset$DateTime, subset$Sub_metering_2, type= "l", col = "red", xlab = "", ylab= "Energy sub metering")
points(subset$DateTime, subset$Sub_metering_3, type= "l", col = "blue", xlab = "", ylab= "Energy sub metering")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot top right
plot(subset$DateTime, subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot bottom right
plot(subset$DateTime, subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()