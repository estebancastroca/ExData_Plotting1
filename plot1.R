household <- read.table("household_power_consumption.txt", header = T, sep = ";")
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
Data1 <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width=480, height=480)
plot_1 <- as.numeric(Data1$Global_active_power)
hist(plot_1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
