##Plotting the data with annotations

ele = read.table(file = "ele.txt", header = TRUE, sep = ";")
ele[,1] = as.Date(ele[,1], format = "%d/%m/%Y")
data1 = subset(ele, ele$Date == "2007-02-01" | ele$Date == "2007-02-02")
str(data1)
data1$Time = strptime(data1$Time, format = "%H:%M:%S")
data1[1:1440, "Time"] = format(data1[1:1440, "Time"], "2007-02-01 %H:%M:%S")
data1[1441:2880, "Time"] = format(data1[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

## Specify that there are multiple plots
par(mfrow = c(2, 2))

## Plotting all the four plots in a single graphic device
with(data1, {
        
        ##Plot1
        plot(data1$Time, data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        
        ##Plot2
        plot(data1$Time, data1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        
        
        ##Plot3
        plot(data1$Time, data1$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
        with(data1, lines(Time, as.numeric(Sub_metering_1)))
        with(data1, lines(Time, as.numeric(Sub_metering_2), col = "red"))
        with(data1, lines(Time, as.numeric(Sub_metering_3), col = "blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)
        
        ##Plot4
        plot(data1$Time, data1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
