###################################################################
# Do the plot1 for the Exploratory Data Analysis course project 1 #
###################################################################
source('prepare_data.R', echo=TRUE)
hpc <- prepare_data()

png(file="./data/plot1.png")
hist(hpc$Global_active_power, col="red"
     , main = "Global Active Power"
     , xlab = "Global Active Power(kilowatts)" )
dev.off()
