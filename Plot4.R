rm(list = ls())
#setwd('C:/Users/O25635/Desktop/prelim modules/Exploratory Data Analysis/CourseProject1/')
EPCData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactor = FALSE)

EPCData$Date <- as.Date(EPCData$Date,"%d/%m/%Y")

EPCData_refined <- EPCData[EPCData$Date >= "2007-02-01" & EPCData$Date <= "2007-02-02",]


#Plot 4
EPCData_refined$DateTime <- as.POSIXct(paste( EPCData_refined$Date, EPCData_refined$Time), format="%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2))
plot(EPCData_refined$DateTime,EPCData_refined$Global_active_power, type='l',ylab= "Global Active Power(kilowatts)",xlab="")



plot(EPCData_refined$DateTime,EPCData_refined$Voltage , type='l',ylab= "Voltage",xlab="datetime")


plot(EPCData_refined$DateTime,EPCData_refined$Sub_metering_1, type='l',col = 'black',
     ylab = "Energysub metering",xlab="")
lines(EPCData_refined$DateTime,EPCData_refined$Sub_metering_2 ,col = 'red')
lines(EPCData_refined$DateTime,EPCData_refined$Sub_metering_3,col = 'blue')
legend("topright",lwd=c(1,1,1), col = c("black", "red", "blue"),bty = "n",yjust=0,
       y.intersp=0.75,legend = c('Sub_metering_1', "Sub_metering_2","Sub_metering_3"))

plot(EPCData_refined$DateTime,EPCData_refined$Global_reactive_power , 
     type='l',ylab= "Global_reactive_power",xlab="datetime")

#saving plot as png file
dev.copy(png, file = "plot4.png")

#closing png device
dev.off()