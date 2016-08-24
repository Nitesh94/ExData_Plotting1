if(!file.exists("household_power_consumption.txt"))
{
    zipfile <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
    unzip(zipfile)
}
ConsumptionData <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
ConsumptionData$Date <- as.Date(ConsumptionData$Date,"%d/%m/%Y")
RequiredData <- ConsumptionData[(ConsumptionData$Date == "2007-02-01" | ConsumptionData$Date == "2007-02-02"),]
datetime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
png("plot2.png",width = 480,height = 480)
plot(datetime,as.numeric(RequiredData$Global_active_power),type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()