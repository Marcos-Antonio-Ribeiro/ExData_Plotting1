###################################################################
# Do the plot1 for the Exploratory Data Analysis course project 1 #
###################################################################

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

# Transform the variables to be ploted
hpc$Global_active_power = as.numeric(hpc$Global_active_power)

# ---------- Finish preparing data

png(file="./data/plot1.png", height = 480, width = 480)
hist(hpc$Global_active_power, col="red"
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)" )

dev.off()

# ---------- Finish plotting

