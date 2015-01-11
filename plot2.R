#read in data
data <- read.table("household_power_consumption.txt", sep=";", 
                 header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE )

#subset data
data <- subset(data, subset=(Date=="1/2/2007" | Date=="2/2/2007"))

#create date time variable
library(lubridate)
data$DateTime <- dmy_hms(paste(data$Date, data$Time))

#create plot 2
with(data,plot(DateTime, Global_active_power,type="n", 
               ylab="Global Active Power (kilowatts)",xlab=""))
with(data,lines(DateTime, Global_active_power))
dev.copy(png,file="plot2.png")
dev.off()

