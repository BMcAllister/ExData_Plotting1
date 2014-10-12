## Read and subset data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses = "character")
sub_data1<-data[data$Date=="1/2/2007",]
sub_data2<-data[data$Date=="2/2/2007",]
sub_data<-rbind(sub_data1,sub_data2)
sub_data$dateTime <- strptime(paste(sub_data$Date, sub_data$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

## Create plot as png
png(file="plot2.png", height=480, width=480)
plot(sub_data$dateTime,sub_data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()