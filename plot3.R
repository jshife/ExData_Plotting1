

#read in data
data <- read.table("household_power_consumption.txt", sep=";", 
                 header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE )

#subset data
data <- subset(data, subset=(Date=="1/2/2007" | Date=="2/2/2007"))

#create date time variable
library(lubridate)
data$DateTime <- dmy_hms(paste(data$Date, data$Time))


#create plot 3
with(data,plot(DateTime, Sub_metering_1,type="n", 
               ylab="Energy sub metering",xlab=""))
with(data,lines(DateTime, Sub_metering_1,col="black"))
with(data,lines(DateTime, Sub_metering_2,col="red"))
with(data,lines(DateTime, Sub_metering_3,col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()

