initial <- read.table(sep=";", file="household_power_consumption.txt", header=TRUE, nrows=100, comment.char = "", na.strings="?")
classes <- sapply(initial, class)
data <- read.table(sep=";", file="household_power_consumption.txt", header=TRUE, nrows=2075260, colClasses=classes, comment.char = "", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_subset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
dt <- strptime(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "plot2.png", width=480, height=480)
with(plot(dt, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab=""))

dev.off()
