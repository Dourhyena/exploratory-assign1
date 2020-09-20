## Reading, formatting and subsetting data
ele = read.table(file = "ele.txt", header = TRUE, sep = ";")
ele[,1] = as.Date(ele[,1], format = "%d/%m/%Y")
data1 = subset(ele, ele$Date == "2007-02-01" | ele$Date == "2007-02-02")

## Plotting the data with annotations
plot1 = hist(as.numeric(x = data1$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")



