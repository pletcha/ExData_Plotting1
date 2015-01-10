## plot1.R
## read file 
df<- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", 
                colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                na.strings="?")

# convert Date column to Date data type
df$Date<-as.Date(df$Date,"%d/%m/%Y")


# Extract data for 02/01/2007 and 02/01/2007
df<- df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]

# not used
ts<- format(as.POSIXct(paste(df$Date, df$Time)), "%Y-%m-%d %H:%M:%S")

df1<- cbind(ts,df)

## max x-axis value
xRange<- as.numeric(length(df$Date))
mys<-c(1:xRange)

# x.axis coordinate scale for plotting
df1<-cbind(mys,df1)


plot(df1$Global_active_power~df1$mys,type="l",xaxt='n',xlab="",
     ylab="Global active power (kilowatts)",cex.axis=0.7,cex.lab=0.7)
axis(1,at=c(1,xRange/2,xRange),labels=c("Thu","Fri","Sat"))


dev.copy(png,file="figure/plot2.png",width=480,height=480,bg="white")
dev.off()

