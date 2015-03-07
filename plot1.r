data<-read.table("household_power_consumption.txt", stringsAsFactors = F, head=T, sep=";")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
### filter data from the dates 2007-02-01 and 2007-02-02
data<-subset(data, data$Date >= as.Date("2007-02-01") & data$Date <=as.Date("2007-02-02"))
Gap<-as.numeric(data$Global_active_power)

hist(Gap, col="red", main = "Global Active Power", ylab="Frequency" , xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
