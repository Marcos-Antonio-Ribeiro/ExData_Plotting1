###################################################################
# Do the plot3 for the Exploratory Data Analysis course project 1 #
###################################################################

Sys.setlocale(category = "LC_ALL", locale = "USA")

############################################################################
# Prepare the data for plotting and save it for later use                  #
# provide the file household_power_consumption.zip at the data subfolder   #
# in order to avoid downloading it again.                                  #
############################################################################

library(dplyr)

file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
origin_file <- "./data/household_power_consumption.zip"
prepared_file <- "./data/hpc20070201a02.txt"

# If the file was not already prepared
if (!file.exists(prepared_file)) {
    
    # Check if the file was already downloaded, if not, do it.
    if(!file.exists(origin_file)){
        download.file(file_url, origin_file )
    }
    
    hpc <- read.table(unz(origin_file,"household_power_consumption.txt")
                      , header=T, sep=";", na.strings = "?", stringsAsFactors = FALSE)
    
    # Subset the data     
    hpc <- subset(hpc, as.Date(Date,"%d/%m/%Y")==as.Date("1/2/2007","%d/%m/%Y")
                  | as.Date(Date,"%d/%m/%Y")==as.Date("2/2/2007","%d/%m/%Y"))
    
    # Create the column datetime concatenating Date and Time variables
    hpc <- mutate(hpc, datetime = paste(Date,Time))
    
    # Write the prepared file
    write.table(hpc, prepared_file, sep=";")
    
} else { # Read the data file prepared before
    
    hpc <- read.table(prepared_file
                      , header=T, sep=";", na.strings = "?", stringsAsFactors = FALSE)
}
 
hpc <- mutate(hpc, datetime = as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S")))

# ---------- Finish preparing data

png(file="./data/plot3.png", height = 480, width = 480)
par(mfrow = c(1, 1), mar=c(4,4,4,2))
with(hpc, {
  plot(datetime, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  points(datetime, Sub_metering_1, col="black", type="l")
  points(datetime, Sub_metering_2, col="red", type="l")
  points(datetime, Sub_metering_3, col="blue", type="l")
  legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
         , col= c("black","red","blue"), lty = 1)
})

dev.off()

# ---------- Finish plotting

