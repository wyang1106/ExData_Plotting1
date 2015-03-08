initial <- read.table(sep=";", file="household_power_consumption.txt", header=TRUE, nrows=100, comment.char = "", na.strings="?")
classes <- sapply(initial, class)
data <- read.table(sep=";", file="household_power_consumption.txt", header=TRUE, nrows=2075260, colClasses=classes, comment.char = "", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_subset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
dt <- strptime(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(data_subset, {
  plot(dt, Global_active_power, type="l", xlab="", ylab = "Global Active Power")
  plot(dt, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  plot(dt, data_subset$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="", col="black")
  lines(dt, data_subset$Sub_metering_2, col="red")
  lines(dt, data_subset$Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         box.lty=0)
  plot(dt, Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")
})

dev.off()
