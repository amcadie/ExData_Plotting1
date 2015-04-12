#read data for Feb1 - Feb2 2007 and set colnames
data <- read.table("household_power_consumption.csv", sep = ",", skip = 66637,
                   nrows = 2879)
colnames(data) <- c("Date", "Time", "Global_active_power", 
                    "Global_reactive_power", "Voltage", "Global_intensity",
                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#create a new column with appropriately formatted date/time
data$Date2 <- as.POSIXlt(paste(as.character(data[,1]), as.character(data[,2]),
                               sep = " "), format = "%d/%m/%y %H:%M:%S")

#create plots
par(mfcol = c(2, 2), mar = c(4, 4, 3, 1), pty = "m")

with(data, plot(Date2, Global_active_power, type = "l",
                ylab = "Global Active Power", 
                xlab = "", cex.axis = 0.8, cex.lab = 0.8))

with(data, plot(Date2, Sub_metering_1, type = "l", ylab = "Energy sub metering", 
                xlab = "", cex.axis = 0.8, cex.lab = 0.8))

#set par to overlay plots
par(new = TRUE)

with(data, plot(Date2, Sub_metering_2, type = "l", col = "red", axes = FALSE,
                ann = FALSE, ylim = c(0, 40)))

par(new = TRUE)

with(data, plot(Date2, Sub_metering_3, type = "l", col = "blue", axes = FALSE,
                ann = FALSE, ylim = c(0,40)))

legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 
           0.6)

with(data, plot(Date2, Voltage, type = "l", xlab = "datetime", 
                ylab = "Voltage", cex.axis = 0.8, cex.lab = 0.8))

with(data, plot(Date2, Global_reactive_power, type = "l", xlab="datetime",
                ylab = "Global_reactive_power", cex.axis = 0.8, cex.lab = 0.8))

#reset par
par(mfcol = c(1,1), mar = c(5.1, 4.1, 4.1, 2.1))