library(lubridate)
setwd("C:/Users/Diego/Documents/Cosas utiles de R/ExData_Plotting1")
consumption<-read.table("./household_power_consumption.txt",sep = ";",
                        header = T,stringsAsFactors = F)

head(consumption)

consumption$Time<-paste(consumption$Date,consumption$Time,sep = " ")
consumption$Time<-dmy_hms(consumption$Time)
consumption$Date<- dmy(consumption$Date)
for(i in 3:9){consumption[,i]<-as.numeric(consumption[,i])}

str(consumption)

consumption<-consumption[(consumption$Date=="2007-02-01" | consumption$Date=="2007-02-02"),]

hist(consumption$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",col = "red")

dev.copy(png,"plot1.png",width = 480, height = 480)
dev.off()

