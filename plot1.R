if(!file.exists("household_power_consumption.txt"))
{
    zipfile <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
    unzip(zipfile)
}
ConsumptionData <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
ConsumptionData$Date <- as.Date(ConsumptionData$Date,"%d/%m/%Y")
RequiredData <- ConsumptionData[(ConsumptionData$Date == "2007-02-01" | ConsumptionData$Date == "2007-02-02"),]
png("plot1.png",width = 480,height = 480)
hist(as.numeric(RequiredData$Global_active_power),col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()