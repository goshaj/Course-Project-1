#skip first three lines if you have done plot1.R, plot2.R or plot3.R
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
cutdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(cutdata$Global_active_power)
GRP <- as.numeric(cutdata$Global_reactive_power)
voltage <- as.numeric(cutdata$Voltage)
submetering1 <- as.numeric(cutdata$Sub_metering_1)
submetering2 <- as.numeric(cutdata$Sub_metering_2)
submetering3 <- as.numeric(cutdata$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
