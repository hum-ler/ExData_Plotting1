# plot4.R

# Input and output files.
data.file <- "data/unzip/household_power_consumption.txt"
png.file  <- "plot4.png"

# Read the data and subset to the 2 given days.
power <- read.table(data.file,
                    header = T,
                    sep = ";",
                    as.is = T,
                    na.strings = "?")
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007", ]

# Convert date and time into a workable format.
power$date.time <- strptime(paste(power$Date, power$Time),
                            format = "%d/%m/%Y %H:%M:%S")

# Save up default par.
par.default <- par(no.readonly = T)

# Reproduce the 2 x 2 plots.
png(png.file, 480, 480, "px")

par(mfrow = c(2, 2))

# Top left.
plot(power$date.time,
     power$Global_active_power,
     type = "l",
     xlab = NA,
     ylab = "Global Active Power")

# Top right.
plot(power$date.time,
     power$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Bottom left.
plot(power$date.time,
     power$Sub_metering_1,
     type = "l",
     xlab = NA,
     ylab = "Energy sub metering")
lines(power$date.time, power$Sub_metering_2, col = "red")
lines(power$date.time, power$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"),
       bty = "n")

# Bottom right.
plot(power$date.time,
     power$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()

# Restore par to default.
par(par.default)
