plot2 <- function(){
    ##read input data
    inputData<-read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", 
                   stringsAsFactors=FALSE, na.strings="?")
    dataplot<- subset(inputData, inputData$Date=="1/2/2007"|inputData$Date=="2/2/2007")
    dataplot$Date <- apply(dataplot[,c('Date','Time')],1,paste,collapse=" ")
    dataplot$newDate<-strptime(dataplot$Date,"%d/%m/%Y %H:%M:%S")
    par(mfrow=c(1,1))
    plot(dataplot$newDate,dataplot$Global_active_power,ylab="Global Active Power (killowatts)",type="l",xlab=" ")
    
    dev.copy(png, file="plot2.png", height=480, width=480,units='px')
    dev.off()
    dataplot
}