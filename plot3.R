#Plot 3
household <- read.table("household_power_consumption.txt", header = T, sep = ";")
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
Data1 <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(Data1$Date, Data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_A_P <- as.numeric(Data1$Global_active_power)
sub_Metering1 <- as.numeric(Data1$Sub_metering_1)
sub_Metering2 <- as.numeric(Data1$Sub_metering_2)
sub_Metering3 <- as.numeric(Data1$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_Metering2, type="l", col="red")
lines(datetime, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
