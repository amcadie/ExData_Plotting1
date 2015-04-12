#read data for Feb1 - Feb2 2007 and set colnames
data <- read.table("household_power_consumption.csv", sep = ",", skip = 66637,
                    nrows = 2879)
colnames(data) <- c("Date", "Time", "Global_active_power", 
                    "Global_reactive_power", "Voltage", "Global_intensity",
                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#create and format histogram for global active power
par(mar = c(2, 4, 2, 2), pty = "s")
with(data, hist(Global_active_power, col = "red", 
                xlab = "Global Active Power (kilowatts)", 
                main = "Global Active Power",
                yaxp = c(0, 1200, 6), cex.axis = 0.7, cex.lab = 0.7,
                cex.main = 0.9))

#reset margins to default values
par(mar = c(5.1, 4.1, 4.1, 2.1))