plot2 <- function() {
        
        # Read data
        data <- read.table("household_power_consumption.txt", sep=";",
                           na.strings = "?", colClasses = c("character", 
                           "character", "numeric", "numeric", "numeric",
                           "numeric", "numeric", "numeric", "numeric"),
                           skip = 1)
        data2 <- subset(data, V3 %in% c("1/2/2007", "2/2/2007"))
        
        # Write date and time as format 'y/m/d h:m:s'
        dt <- paste(data2$V1, data2$V2)
        dt2 <- strptime(dt, "%d/%m/%Y %H:%M:%S")
        
        # Open PNG graphic device
        png(file = "plot2.png",
            width = 480, height = 480)
        
        # Plot global active power versus data/time as line
        plot(dt2, data2$V3, main = "", type = "l",
             xlab = "datetime", ylab = "Global Active Power (kilowatts)")
        
        # Close graphic device
        dev.off()
}