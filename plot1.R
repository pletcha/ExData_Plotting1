## plot1.R

## read file 
df<- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", 
                colClass=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                na.strings="?")

# convert Date column to Date data type
df$Date<-as.Date(df$Date,"%d/%m/%Y")


# Extract data for 02/01/2007 and 02/01/2007
df<- df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]

# draw histogram
hist(df$Global_active_power,col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency", cex.axis=0.7,cex.lab=0.7)


dev.copy(png,file="figure/plot1.png",width=480,height=480,bg="white")
dev.off()
