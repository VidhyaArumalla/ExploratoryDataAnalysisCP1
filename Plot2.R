rm(list = ls())

EPCData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactor = FALSE)

EPCData$Date <- as.Date(EPCData$Date,"%d/%m/%Y")

EPCData_refined <- EPCData[EPCData$Date >= "2007-02-01" & EPCData$Date <= "2007-02-02",]

par(mar= c(5,4,1,2))
#Plot 2
EPCData_refined$DateTime <- as.POSIXct(paste( EPCData_refined$Date, EPCData_refined$Time), format="%Y-%m-%d %H:%M:%S")
plot(EPCData_refined$DateTime,EPCData_refined$Global_active_power, type='l',ylab= "Global Active Power(kilowatts)",xlab="")

#saving plot as png file
dev.copy(png, file = "plot2.png")

#closing png device
dev.off()