source("datacommons.R")

data.acquire()
data <- data.load()

png( filename="plot3.png" )

with( data, plot( DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering" ) )

with( data, lines( DateTime, Sub_metering_1 ) )
with( data, lines( DateTime, Sub_metering_2, col="red" ) )
with( data, lines( DateTime, Sub_metering_3, col="blue" ) )

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue") )

dev.off()

