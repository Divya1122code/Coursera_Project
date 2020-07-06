df=read.table("household_power_consumption.txt", header=TRUE, sep=";", 
              stringsAsFactors=FALSE, dec=".")

subsetData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

Active_Power <- as.numeric(subsetData$Global_active_power)

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

s1 <- as.numeric(subSetData$Sub_metering_1)
s2 <- as.numeric(subSetData$Sub_metering_2)
s3 <- as.numeric(subSetData$Sub_metering_3)

plot(datetime, s1, type="l", ylab="Energy Submetering")
lines(datetime, s2, type="l", col="red")
lines(datetime, s3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2.5, col=c("black", "red", "blue"))
