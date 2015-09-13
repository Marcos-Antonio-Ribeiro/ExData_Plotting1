###################################################################
# Do the plot4 for the Exploratory Data Analysis course project 1 #
###################################################################
source('prepare_data.R', echo=TRUE)
hpc <- prepare_data()

png(file="./data/plot4.png")
par(mfrow = c(2, 2), mar=c(5,5,3,1))
with(hpc, {
  plot(Global_active_power~datetime, xlab = "", ylab = "Global Active Power", type="l")
  
  plot(datetime, Voltage, xlab = "datetime", type="l")
  
  plot(datetime, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  points(datetime, Sub_metering_1, col="black", type="l")
  points(datetime, Sub_metering_2, col="red", type="l")
  points(datetime, Sub_metering_3, col="blue", type="l")
  legend("topright", legend= c("Sub_metering1","Sub_metering2","Sub_metering3")
         , col= c("black","red","blue"), pch = 95)
  
  plot(Global_reactive_power~datetime, xlab = "datetime", type="l")
})

dev.off()
