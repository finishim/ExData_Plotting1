plot2 <- function() {
    
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
    
}