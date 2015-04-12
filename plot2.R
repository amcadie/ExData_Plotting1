#read data for Feb1 - Feb2 2007 and set colnames
data <- read.table("household_power_consumption.csv", sep = ",", skip = 66637,
                   nrows = 2879)
colnames(data) <- c("Date", "Time", "Global_active_power", 
                    "Global_reactive_power", "Voltage", "Global_intensity",
                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#create a new column with appropriately formatted date/time
data$Date2 <- as.POSIXlt(paste(as.character(data[,1]), as.character(data[,2]),
                sep = " "), format = "%d/%m/%y %H:%M:%S")

#plot global active power vs formatted date
par(mar = c(2, 4, 2, 2), pty = "s")
with(data, plot(Date2, Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)", 
                xlab = "", cex.axis = 0.8, cex.lab = 0.8))

#reset margins to default values
par(mar = c(5.1, 4.1, 4.1, 2.1))