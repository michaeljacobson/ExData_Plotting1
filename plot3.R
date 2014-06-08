plot3 <- function() {
        
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
        png(file = "plot3.png",
            width = 480, height = 480)
        
        # Plot energy sub meterings versus data/time as three lines
        # Legend is added at top-right
        plot(dt2, data2$V7, main = "", type = "n",
             xlab = "datetime", ylab = "Energy sub metering")
        points(dt2, data2$V7, type = "l")
        points(dt2, data2$V8, type = "l", col = "red")
        points(dt2, data2$V9, type = "l", col = "blue")
        legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        # Close graphic device
        dev.off()
}