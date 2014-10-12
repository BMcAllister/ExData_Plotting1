a
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses = "character")
sub_data1<-data[data$Date=="1/2/2007",]
sub_data2<-data[data$Date=="2/2/2007",]
sub_data<-rbind(sub_data1,sub_data2)
sub_data$dateTime <- strptime(paste(sub_data$Date, sub_data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

## Create png
png(file="plot4.png", height=480, width=480)

## Create plots
par(mfrow = c(2, 2))
with(sub_data, {
  plot(dateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(dateTime,Voltage,type="l",xlab="datetime",ylab="Voltage")
  with(sub_data, plot(dateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
  with(sub_data, lines(dateTime,Sub_metering_2,type="l",col="red"))
  with(sub_data, lines(dateTime,Sub_metering_3,type="l",col="blue"))
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), lty=1, bty="n")
  plot(dateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()