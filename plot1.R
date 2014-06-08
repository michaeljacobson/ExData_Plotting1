plot1 <- function() {
        
        # Read data
        data <- read.table("household_power_consumption.txt", sep=";",
                           na.strings = "?", colClasses = c("character", 
                           "character", "numeric", "numeric", "numeric",
                           "numeric", "numeric", "numeric", "numeric"),
                           skip = 1)
        data2 <- subset(data, V3 %in% c("1/2/2007", "2/2/2007"))
        
        # Open PNG graphic device
        png(file = "plot1.png",
            width = 480, height = 480)
        
        # Plot global active power as histogram with red color
        hist(data2$V3, main="Global Active Power",col="red",
             xlab="Global Active Power (kilowatts)")
        
        # Close graphic device
        dev.off()
}
