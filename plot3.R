plot3 <- function() {
    
    # Exploratory Data Analysis
    # Course Project 1
    
    # Download the file and extract the portion needed
    
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, destfile = ".\\data\\power.zip", mode = "wb")
    file <- unzip(".\\data\\power.zip", exdir = ".\\data")
    
    # We will only be using data from the dates 2007-02-01 and 2007-02-02.
    
    ## Read all the data and subset
    power <- read.table(file, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
    power[,1] <- as.Date(power[,1],format='%d/%m/%Y')
    power <- power[(power$Date=="2007/02/01") | (power$Date=="2007/02/02"),]
    
    ## Combine date and time
    power <- within(power, datetime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S"))
    ### source: http://stackoverflow.com/questions/5250978/colclasses-date-and-time-read-csv
    
    # Plot the graph
    
    png(filename = 'plot3.png', width = 480, height = 480)
    plot(power$datetime, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(power$datetime, power$Sub_metering_2, type="l", col="red")
    lines(power$datetime, power$Sub_metering_3, type="l", col="blue")
    ### source: http://stackoverflow.com/questions/2564258/plot-two-graphs-in-same-plot-in-r
    
    # Add Legend
    
    legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)
    ### source: http://www.inside-r.org/r-doc/graphics/legend
    
    # Save the plot to a file
    #dev.copy(device = png, filename = 'plot3.png', width = 480, height = 480)
    dev.off()
    ### source: http://stackoverflow.com/questions/7144118/how-to-save-a-plot-as-image-on-the-disk
    
}