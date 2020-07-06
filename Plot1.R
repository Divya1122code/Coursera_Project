df=read.table("household_power_consumption.txt", header=TRUE, sep=";", 
              stringsAsFactors=FALSE, dec=".")

subsetData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

Active_Power <- as.numeric(subsetData$Global_active_power)


png("plot1.png", width=480, height=480)

hist(Active_Power, col = "red", main = "Global Active Power Graph", 
     xlab = "Global Active Power (kilowatts)", breaks = 12, ylim = c(0, 1200))
