

#read in data
data <- read.table("household_power_consumption.txt", sep=";", 
                 header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE )

#subset data
data <- subset(data, subset=(Date=="1/2/2007" | Date=="2/2/2007"))

#create date time variable
library(lubridate)
data$DateTime <- dmy_hms(paste(data$Date, data$Time))


#create plot 1
with(data,hist(Global_active_power,col="red",
               main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot1.png")
dev.off()