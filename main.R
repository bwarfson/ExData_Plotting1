#setwd("C:/Users/bwight/Dropbox/Learning/Coursera/Data Science/Exploratory Data Analysis/ExData_Plotting1")
setwd("C:/Users/brad/Dropbox/Learning/Coursera/Data Science/Exploratory Data Analysis/ExData_Plotting1")

library(data.table)

get.data <- function() {
  "Checks for data directory and creates one if it doesn't exist"
  if (!file.exists("data")) {
    message("Creating data directory")
    dir.create("data")
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zipfile="data/exdata-data-household_power_consumption.zip"
    message("Downloading data")
    download.file(fileURL, destfile=zipfile)
    unzip(zipfile, exdir="data")
  }
  
  #http://www.inside-r.org/packages/cran/data.table/docs/fread
  DT <- fread("data/household_power_consumption.txt", sep="auto", na.strings="?", skip=66637, nrows=2879, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
  setnames(DT, c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  DT$DateTime <- as.POSIXct(strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S"))
  DT
}
