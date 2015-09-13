###################################################################
# Do the plot2 for the Exploratory Data Analysis course project 1 #
###################################################################
source('prepare_data.R', echo=TRUE)
hpc <- prepare_data()

library(dplyr)
hpc2 <- mutate(hpc, datetime = as.POSIXct(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"),tz = "GMT"))

png(file="./data/plot2.png")
par(mfrow = c(1, 1), mar=c(4,4,4,2))
with(hpc2, {
  plot(Global_active_power~datetime, xlab = "", ylab = "Global Active Power (Kilowatts)", type="l")
})
dev.off()
