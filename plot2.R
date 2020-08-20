household <- read.table("household_power_consumption.txt", header = T, sep = ";")
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
Data1 <- household[household$Date %in% c("1/2/2007","2/2/2007") ,]

Data1$Date <- as.Date(Data1$Date, format="%d/%m/%Y")
Data1$Time <- strptime(Data1$Time, format="%H:%M:%S")
Data1[1:1440,"Time"] <- format(Data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Data1[1441:2880,"Time"] <- format(Data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png(file = "plot2.png", width=480, height=480)
plot(Data1$Time,as.numeric(as.character(Data1$Global_active_power)),
     type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
dev.off()
