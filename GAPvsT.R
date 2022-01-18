activepower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(activepower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power2007 <- subset(activepower,activepower$Date=="1/2/2007" | activepower$Date =="2/2/2007")

power2007$Date <- as.Date(power2007$Date, format="%d/%m/%Y")
power2007$Time <- strptime(power2007$Time, format="%H:%M:%S")
power2007[1:1440,"Time"] <- format(power2007[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power2007[1441:2880,"Time"] <- format(power2007[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


plot(power2007$Time,as.numeric(as.character(power2007$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")