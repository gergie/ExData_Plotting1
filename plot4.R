source("datacommons.R")

data.acquire()
data <- data.load()

png( filename="plot4.png" )

par( mfrow=c(2, 2) )

## Upper left (same plot as plot2)
with( data, plot( DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power" ) )
with( data, lines( DateTime, Global_active_power ) )


## Upper right
with( data, plot( DateTime, Voltage, type="n", xlab="datetime", ylab="Voltage") )
with( data, lines( DateTime, Voltage ) )

## Lower left (same plot as plot3)
with( data, plot( DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering" ) )
with( data, lines( DateTime, Sub_metering_1 ) )
with( data, lines( DateTime, Sub_metering_2, col="red" ) )
with( data, lines( DateTime, Sub_metering_3, col="blue" ) )
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n" )


## Lower right
with( data, plot( DateTime, Global_reactive_power, type="n", xlab="datetime", ylab="Global Reactive Power" ) )
with(data, lines( DateTime, Global_reactive_power) )

dev.off()

