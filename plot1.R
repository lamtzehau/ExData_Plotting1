plot1 <- function(){
    ##read input data
    df<-read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", 
                   stringsAsFactors=FALSE, na.strings="?")
    dataplot<- subset(df, df$Date=="1/2/2007"|df$Date=="2/2/2007") 
    #file to store the plot   
    jpeg('plot1.jpg',width=480,height=480,units='px')
    par(mfrow=c(1,1))
    hist(dataplot$Global_active_power,main="Global Active Power (killowatts)",xlab="Global Active Power",col="red")
    
    #close the graphical device
    dev.off()
    
}