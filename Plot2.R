df=read.table("household_power_consumption.txt", header=TRUE, sep=";", 
              stringsAsFactors=FALSE, dec=".")

subsetData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

Active_Power <- as.numeric(subsetData$Global_active_power)

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(datetime, Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

