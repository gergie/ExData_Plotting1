## Acquires the data set, i.e.
## checks if it is already there,
## or downloads an unzips it in case it's not.
data.acquire <- function() {
    if( !file.exists( "./data/household_power_consumption.txt" ) ) {
        print( "Data set not found, start downloading ..." )
        download.file(
            url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
            destfile="./household_power_consumption.zip",
            method="libcurl" )
        print( "... unzipping ..." )
        unzip( "./household_power_consumption.zip", exdir="./data" )
        file.remove( "./household_power_consumption.zip" )
        print( "Data set acquired." )
    } else {
        print( "Data set found." )
    }
}


## Load the data set,
## converts and merges the Date and Time columns to one DateTime column,
## and extracts only the dates "2007-02-01" and "2007-02-02"
data.load <- function() {
    print( "Loading data ..." )
    data <- read.table( "./data/household_power_consumption.txt",
                       header=TRUE,
                       sep=";",
                       na.strings="?" )

    ## Merge Date and Time columnn to one column "DateTime"
    data$DateTime <- strptime( paste( data$Date, data$Time ), format="%d/%m/%Y %H:%M:%S" )
    data$Time <- NULL
    data$Date <- NULL

    data[data$DateTime>"2007-02-01" & data$DateTime<="2007-02-03",]
}
