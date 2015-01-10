## plot1.R

## read file 
df<- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", 
                colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                na.strings="?")

# convert Date column to Date data type
df$Date<-as.Date(df$Date,"%d/%m/%Y")


# Extract data for 02/01/2007 and 02/01/2007
df<- df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]

ts<- format(as.POSIXct(paste(df$Date, df$Time)), "%Y-%m-%d %H:%M:%S")

# added this but then, didn't use it
df1<- cbind(ts,df)

# use this as x-axis scale
## max x-axis value
xRange<- as.numeric(length(df$Date))
mys<-c(1:xRange)

df1<-cbind(mys,df1)
# divide graphics object into 4 parts
par(mfrow=c(2,2))

with (df1,{
 
  # plot line graph #1; place related plot/lines/axis/legend function calls in one { } block
{
  plot(df1$Global_active_power~df1$mys,type="l",xaxt='n',xlab="",
       ylab="Global active power (kilowatts)",cex.axis=0.7,cex.lab=0.7)
  axis(1,at=c(1,xRange/2,xRange),labels=c("Thu","Fri","Sat"))

}

{
  plot(Voltage~mys,type="l",xaxt='n',xlab="datetime",
       ylab="Voltage",cex.axis=0.7,cex.lab=0.7)
  axis(1,at=c(1,xRange/2,xRange),labels=c("Thu","Fri","Sat"))
  
}

{
  plot(Sub_metering_1~mys,type="l",xaxt='n',xlab="",ylab="Energy sub metering" ,cex.axis=0.7,cex.lab=0.7)
  
  lines(Sub_metering_2~mys,type="l",col="red")
  lines(Sub_metering_3~mys,type="l",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n",lwd=0.5
         , cex=0.6, col=c("black","red","blue"), lty=c(1,1,1), y.intersp=0.5,text.width=1100)
  axis(1,at=c(1,xRange/2,xRange),labels=c("Thu","Fri","Sat"))
}



{
  plot(Global_reactive_power~mys,type="l",xaxt='n',xlab="datetime",
       ylab="Global reactive power",cex.axis=0.7,cex.lab=0.7)
  axis(1,at=c(1,xRange/2,xRange),labels=c("Thu","Fri","Sat"))
  
}


})

dev.copy(png,file="figure/plot4.png",width=480,height=480,bg="white")
dev.off()

