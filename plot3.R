plot3 <- function(){
    ##read input data
    inputData<-read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", 
                          stringsAsFactors=FALSE, na.strings="?")
    dataplot<- subset(inputData, inputData$Date=="1/2/2007"|inputData$Date=="2/2/2007")
    dataplot$Date <- apply(dataplot[,c('Date','Time')],1,paste,collapse=" ")
    dataplot$newDate<-strptime(dataplot$Date,"%d/%m/%Y %H:%M:%S")
    par(mfrow=c(1,1))
    with(dataplot, {
        plot(newDate,Sub_metering_1, type="l",
             ylab="Energy sub metering", xlab=" ")
          lines(newDate,Sub_metering_2,col="red")
          lines(newDate,Sub_metering_3, col="blue")
    })
    legend("topright",col=c("black","red","blue"),lty=1,lwd=2,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
                    
    
    #copy plot to a a png file
    dev.copy(png, file="plot3.png", height=576, width=576,units='px')
    dev.off()
    
}