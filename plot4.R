plot4 <- function(){
    ##read input data
    inputData<-read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", 
                          stringsAsFactors=FALSE, na.strings="?")
    dataplot<- subset(inputData, inputData$Date=="1/2/2007"|inputData$Date=="2/2/2007")
    dataplot$Date <- apply(dataplot[,c('Date','Time')],1,paste,collapse=" ")
    dataplot$newDate<-strptime(dataplot$Date,"%d/%m/%Y %H:%M:%S")
    par(mfrow=c(2,2))
    plot(dataplot$newDate,dataplot$Global_active_power,ylab="Global Active Power (killowatts)",type="l",xlab=" ")
    plot(dataplot$newDate,dataplot$Voltage,ylab="Voltage",type="l",xlab=" ")
    with(dataplot, {
        plot(newDate,Sub_metering_1, type="l",
             ylab="Energy sub metering", xlab=" ")
        lines(newDate,Sub_metering_2,col="red")
        lines(newDate,Sub_metering_3, col="blue")
    })
    legend("topright",col=c("black","red","blue"),lty=1,lwd=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(dataplot$newDate,dataplot$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab=" ")

   
    
    
    #copy plot to a a png file
    dev.copy(png, file="plot4.png", height=480, width=480,units='px')
    dev.off()
    
    dataplot
}