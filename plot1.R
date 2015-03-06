plot1 <- function(){
    ##read input data
    df<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = T, sep=";", comment.char="%", 
                   stringsAsFactors=FALSE, na.strings="?")
    dataplot<- subset(df, df$Date=="1/2/2007"|df$Date=="2/2/2007") 
    jpeg('plot1.jpg')
    histinfo <-hist(dataplot$Global_active_power,main="Global Active Power",xlab="Global Active Power",col="red")
    print(histinfo)
    dev.off()
    dataplot
}