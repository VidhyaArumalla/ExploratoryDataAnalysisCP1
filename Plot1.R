rm(list = ls())

EPCData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactor = FALSE)

EPCData$Date <- as.Date(EPCData$Date,"%d/%m/%Y")

EPCData_refined <- EPCData[EPCData$Date >= "2007-02-01" & EPCData$Date <= "2007-02-02",]

par(mfrow=c(1,1))
#Plot 1
EPCData_refined$Global_active_power = as.numeric(EPCData_refined$Global_active_power)
hist(EPCData_refined$Global_active_power, col = "red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")

#saving plot as png file
dev.copy(png, file = "plot1.png")

#closing png device
dev.off()