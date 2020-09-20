## Creating a png file
png("plot2.png")

##Reading, formatting and subsetting data
ele = read.table(file = "ele.txt", header = TRUE, sep = ";")
ele[,1] = as.Date(ele[,1], format = "%d/%m/%Y")
data1 = subset(ele, ele$Date == "2007-02-01" | ele$Date == "2007-02-02")
data1$Time = strptime(data1$Time, format = "%H:%M:%S")
data1[1:1440, "Time"] = format(data1[1:1440, "Time"], "2007-02-01 %H:%M:%S")
data1[1441:2880, "Time"] = format(data1[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

##Plotting the data with annotations
plot(data1$Time, data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Finish writing to png
dev.off()