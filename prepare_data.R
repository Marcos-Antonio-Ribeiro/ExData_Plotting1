# Prepare the data to do the plots (1, 2, 3 and 4) and save it for later
# The file household_power_consumption.txt must be provided at the data subfolder
prepare_data <- function() {
  library(dplyr)
  
  # If the file was not already processed...
  if (!file.exists("./data/hpc20070201a02.txt")){

    # Read the data file
    hpc <- read.table("./data/household_power_consumption.txt", header=T, sep=";", na.strings = "?", stringsAsFactors = FALSE)

    # Subset the data     
    hpc <- subset(hpc, as.Date(Date,"%d/%m/%Y")==as.Date("1/2/2007","%d/%m/%Y")
                  | as.Date(Date,"%d/%m/%Y")==as.Date("2/2/2007","%d/%m/%Y"))

    # Create the column datetime concatenating Date and Time variables
    hpc <- mutate(hpc, datetime = paste(Date,Time))
    
    write.table(hpc, "./data/hpc20070201a02.txt",sep = ";")
  }

  # Read the data file created before
  hpc <- read.csv("./data/hpc20070201a02.txt", sep = ";")

  # Transform the variables to be ploted
  hpc$Voltage = as.numeric(hpc$Voltage)
  hpc$Global_active_power = as.numeric(hpc$Global_active_power)
  hpc$Global_reactive_power = as.numeric(hpc$Global_reactive_power)
  hpc$Global_intensity = as.numeric(hpc$Global_intensity)
  hpc <- mutate(hpc, datetime = as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"),tz = "GMT"))
}
# ---------- Finish preparing data