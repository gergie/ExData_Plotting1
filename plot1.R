source("datacommons.R")

data.acquire()
data <- data.load()

png( filename="plot1.png" )

hist( data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )

dev.off()

