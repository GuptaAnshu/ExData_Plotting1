#
power <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
power$Date <-as.Date(power$Date, format='%d/%m/%Y')
powerDate <- power[power$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]
datetime<-as.POSIXct(paste(powerDate$Date,powerDate$Time))
powerDate <- cbind(powerDate,datetime)
png('plot3.png')
plot(powerDate$datetime,as.numeric(as.character(powerDate$Sub_metering_1)),type = "l",xlab="DateTime",ylab="Energy sub metering", format="%a")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(powerDate$datetime,as.numeric(as.character(powerDate$Sub_metering_2)),type = "l",col="red")
lines(powerDate$datetime,as.numeric(as.character(powerDate$Sub_metering_3)),type = "l",col="blue")
dev.off()
