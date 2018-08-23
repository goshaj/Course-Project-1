#skip first three lines if you have done plot1.R
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
cutdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(cutdata$Date, cutdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(cutdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
