source("datacommons.R")

data.acquire()
data <- data.load()

png( filename="plot2.png" )

with( data, plot( DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)" ) )
with( data, lines( DateTime, Global_active_power ) )

dev.off()

