if(!file.exists("household_power_consumption.txt"))
{
    zipfile <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
    unzip(zipfile)
}
ConsumptionData <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
ConsumptionData$Date <- as.Date(ConsumptionData$Date,"%d/%m/%Y")
RequiredData <- ConsumptionData[(ConsumptionData$Date == "2007-02-01" | ConsumptionData$Date == "2007-02-02"),]
datetime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
SubMetering1 <- as.numeric(RequiredData$Sub_metering_1)
SubMetering2 <- as.numeric(RequiredData$Sub_metering_2)
SubMetering3 <- as.numeric(RequiredData$Sub_metering_3)
png("plot4.png",width = 480,height = 480)
par(mfrow = c(2,2),mar = c(3,5,3,1))
plot(datetime,as.numeric(RequiredData$Global_active_power),type = "l",ylab = "Global Active Power",xlab = "")
plot(datetime,as.numeric(RequiredData$Voltage),type = "l",ylab = "Voltage",xlab = "")
plot(datetime,SubMetering1,type = "l",xlab="",ylab="Energy Sub Metering")
lines(datetime,SubMetering2,type = "l",col = "red")
lines(datetime,SubMetering3,type = "l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c("black", "red", "blue"),bty = "n")
plot(datetime,as.numeric(RequiredData$Global_reactive_power),type = "l",ylab = "Voltage",xlab = "")
dev.off()