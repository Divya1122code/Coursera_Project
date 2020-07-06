df=read.table("household_power_consumption.txt", header=TRUE, sep=";", 
              stringsAsFactors=FALSE, dec=".")

subsetData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

Active_Power <- as.numeric(subsetData$Global_active_power)
Reactive_Power <- as.numeric(subSetData$Global_reactive_power)
volt <- as.numeric(subSetData$Voltage)

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

s1 <- as.numeric(subSetData$Sub_metering_1)
s2 <- as.numeric(subSetData$Sub_metering_2)
s3 <- as.numeric(subSetData$Sub_metering_3)

par(mfrow = c(2, 2)) 


plot(datetime, Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, s1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, s2, type="l", col="red")
lines(datetime, s3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lwd=2.5, col=c("black", "red", "blue"), bty="n",cex=0.5)

plot(datetime, Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")
