data<-read.table("household_power_consumption.txt", stringsAsFactors = F, head=T, sep=";")

x<-paste(data$Date, data$Time)
y<-strptime(x, "%d/%m/%Y %H:%M:%S")
data<-cbind(data, y)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
### filter data from the dates 2007-02-01 and 2007-02-02
data<-subset(data, data$Date >= as.Date("2007-02-01") & data$Date <=as.Date("2007-02-02"))
png("plot3.png", width = 480, height=480, units = "px")
plot(data$y, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
with(data, lines(data$y, data$Sub_metering_1, col="black"))
with(data, lines(data$y, data$Sub_metering_2, col="red"))
with(data, lines(data$y, data$Sub_metering_3, col="blue"))
legend("topright", c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"), col = c("black", "red", "blue"), lty=c(1,1), cex=1)
dev.off()