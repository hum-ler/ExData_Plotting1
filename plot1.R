# plot1.R

# Input and output files.
data.file <- "data/unzip/household_power_consumption.txt"
png.file  <- "plot1.png"

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

# Reproduce plot 1.
png(png.file, 480, 480, "px")
hist(power$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
