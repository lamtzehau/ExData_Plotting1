data<-read.table("household_power_consumption.txt", stringsAsFactors = F, head=T, sep=";")

x<-paste(data$Date, data$Time)
y<-strptime(x, "%d/%m/%Y %H:%M:%S")
data<-cbind(data, y)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
### filter data from the dates 2007-02-01 and 2007-02-02
data<-subset(data, data$Date >= as.Date("2007-02-01") & data$Date <=as.Date("2007-02-02"))

plot(data$y, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()