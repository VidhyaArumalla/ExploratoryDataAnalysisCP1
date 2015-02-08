rm(list = ls())

EPCData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactor = FALSE)

EPCData$Date <- as.Date(EPCData$Date,"%d/%m/%Y")

EPCData_refined <- EPCData[EPCData$Date >= "2007-02-01" & EPCData$Date <= "2007-02-02",]

par(mar= c(5,4,1,2))
#Plot 3
EPCData_refined$DateTime <- as.POSIXct(paste( EPCData_refined$Date, EPCData_refined$Time), format="%Y-%m-%d %H:%M:%S")
plot(EPCData_refined$DateTime,EPCData_refined$Sub_metering_1, type='l',col = 'black',ylab = "Energysub metering",xlab="")
lines(EPCData_refined$DateTime,EPCData_refined$Sub_metering_2 ,col = 'red')
lines(EPCData_refined$DateTime,EPCData_refined$Sub_metering_3,col = 'blue')
legend("topright",lwd=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#saving plot as png file
dev.copy(png, file = "plot3.png")

#closing png device
dev.off()