###################################################################
# Do the plot3 for the Exploratory Data Analysis course project 1 #
###################################################################
source('prepare_data.R', echo=TRUE)
hpc <- prepare_data()

library(dplyr)
hpc2 <- mutate(hpc, datetime = as.POSIXct(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"),tz = "GMT"))

png(file="./data/plot3.png")
par(mfrow = c(1, 1), mar=c(4,4,4,2))
with(hpc2, {
  plot(datetime, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  points(datetime, Sub_metering_1, col="black", type="l")
  points(datetime, Sub_metering_2, col="red", type="l")
  points(datetime, Sub_metering_3, col="blue", type="l")
  legend("topright", legend= c("Sub_metering1","Sub_metering2","Sub_metering3")
         , col= c("black","red","blue"), pch = 95)
})
dev.off()
