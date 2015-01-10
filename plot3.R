## plot1.R

## read file 
df<- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", 
                colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                na.strings="?")

# convert Date column to Date data type
df$Date<-as.Date(df$Date,"%d/%m/%Y")


# Extract data for 02/01/2007 and 02/01/2007
df<- df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]

# draw line graph
plot(df$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")


# computed but not used
ts<- format(as.POSIXct(paste(df$Date, df$Time)), "%Y-%m-%d %H:%M:%S")

df1<- cbind(ts,df)

## max x-axis value
xRange<- as.numeric(length(df$Date))
mys<-c(1:xRange)

# x-axis scale
df1<-cbind(mys,df1)



plot(df1$Sub_metering_1~df1$mys,type="l",xaxt='n',xlab="",ylab="Energy sub metering" ,cex.axis=0.7,cex.lab=0.7)

## create legend coordinates
plot_size<-par("usr")
x1<-plot_size[2]
y1<-plot_size[4]
x2<-x1-800
y2<-y1-6.5

lines(df1$Sub_metering_2~df1$mys,type="l",col="red")
lines(df1$Sub_metering_3~df1$mys,type="l",col="blue")
legend(x=c(x1,x2),y=c(y1,y2),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "o",lwd=1
       , cex=0.6, col=c("black","red","blue"), lty=c(1,1,1), y.intersp=0.75, text.width=500)
axis(1,at=c(1,xRange/2,xRange),labels=c("Thu","Fri","Sat"))
dev.copy(png,file="figure/plot3.png",width=480,height=480,bg="white")
dev.off()

