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

x11()
par(mfrow=c(2,2))

plot(consumption$Time,consumption$Global_active_power,type = "line",
     ylab = "Global Active Power",xlab = "Date")
plot(consumption$Time,consumption$Voltage,type = "line",
     ylab = "voltage",xlab = "Date")

plot(consumption$Time,consumption$Sub_metering_1,type = "line",ylab = "Energy sub metering",xlab = "Date")
points(consumption$Time,consumption$Sub_metering_2,type="line",col="red")
points(consumption$Time,consumption$Sub_metering_3,type="line",col="blue")
legend("topright",lty=1:1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(consumption$Time,consumption$Global_reactive_power,type = "line",
     ylab = "Global Reactive Power",xlab = "Date")


dev.copy(png,"plot4.png",width = 480, height = 480)
dev.off()