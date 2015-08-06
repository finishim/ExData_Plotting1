# Exploratory Data Analysis
# Course Project 1

# Download the file and extract the portion needed

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = ".\\data\\power.zip", mode = "wb")
unzip(".\\data\\power.zip", exdir = ".\\data")


## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
## Read the data from just those dates

## Convert Date and Time variables to Date/Time classes in R using the `strptime()` and `as.Date()`
