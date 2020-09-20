##Reading, formatting and subsetting data
ele = read.table(file = "ele.txt", header = TRUE, sep = ";")
ele[,1] = as.Date(ele[,1], format = "%d/%m/%Y")
data1 = subset(ele, ele$Date == "2007-02-01" | ele$Date == "2007-02-02")
data1$Time = strptime(data1$Time, format = "%H:%M:%S")
data1[1:1440, "Time"] = format(data1[1:1440, "Time"], "2007-02-01 %H:%M:%S")
data1[1441:2880, "Time"] = format(data1[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

##Plotting the data with annotations

## Create empty plot
plot(data1$Time, data1$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")

## Plot Sub_metering_1
with(data1, lines(Time, as.numeric(Sub_metering_1)))

## Plot Sub_metering_2
with(data1, lines(Time, as.numeric(Sub_metering_2), col = "red"))

## Plot Sub_metering_3
with(data1, lines(Time, as.numeric(Sub_metering_3), col = "blue"))

## Annotating and specifying legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))