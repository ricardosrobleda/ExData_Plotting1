#Description: Measurements of electric power consumption in one household with a
#one-minute sampling rate over a period of almost 4 years. Different electrical 
#quantities and some sub-metering values are available.

library(stringr)

#Read file with Household power consumption
EPC=read.csv("household_power_consumption.txt",sep=";",dec=".",header = TRUE)

#Configure Date
EPC$fecha=as.Date(EPC$Date,format ="%d/%m/%Y")
p=subset(EPC,fecha>="2007-02-01")
k=subset(p,fecha<="2007-02-02")

##PLOT4
par(mfcol= c(2,2))
par(cex = 0.5) 
plot(k$Time,k$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(k$Time,k$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(k$Time,k$Sub_metering_2,col="red")
lines(k$Time,k$Sub_metering_3,col="blue")
legend("topright",legend =c("Sub_metering_1,","Sub_metering_2","Sub_metering_3"),text.col =c("black","red","blue"))
plot(k$Time,k$Voltage, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(k$Time,k$Global_reactive_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Save Plot as "plot4.png" in directory
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
