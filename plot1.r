## Read and subset data
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses = "character")
sub_data1<-data[data$Date=="1/2/2007",]
sub_data2<-data[data$Date=="2/2/2007",]
sub_data<-rbind(sub_data1,sub_data2)

## Create histogram as png
png(file="plot1.png", height=480, width=480)
hist(as.numeric(sub_data$Global_active_power),  xlab = "Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()