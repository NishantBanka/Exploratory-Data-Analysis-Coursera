hpc <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
hpc <- subset(hpc,hpc$V1=='1/2/2007' | hpc$V1=='2/2/2007')
colnames(hpc)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hpc$TimeStamp <- paste(hpc$Date,hpc$Time)

#1
hist(as.numeric(hpc$Global_active_power),breaks = 16,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

#2
plot(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Global_active_power,type='l',ylab="Global Active Power(kilowatts)",xlab="")
#3
plot(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Sub_metering_1,type='l',col="black",ylab="Energy sub metering",xlab="")
lines(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Sub_metering_2,type='l',col="red")
lines(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Sub_metering_3,type='l',col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75)


#4
par(mfrow=c(2,2))
plot(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Global_active_power,type='l',ylab="Global Active Power(kilowatts)",xlab="")

plot(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Voltage,type='l',ylab="Voltage",xlab="datetime")

plot(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Sub_metering_1,type='l',col="black",ylab="Energy sub metering",xlab="")
lines(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Sub_metering_2,type='l',col="red")
lines(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Sub_metering_3,type='l',col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)

plot(strptime(hpc$TimeStamp,"%d/%m/%Y %H:%M:%S"),hpc$Global_reactive_power,type='l',ylab="Global_reactive_power",xlab="datetime")