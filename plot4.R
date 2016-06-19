## Get all the data to subset to what we need
allData <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

#get the subset
hhp <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(hhp$Date), hhp$Time) 
hhp$Datetime <- as.POSIXct(datetime) 

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

##Graph 1
with(hhp, plot(Global_active_power~Datetime, type="l",  
              ylab="Global Active Power", xlab=""))

##Graph 2
with(hhp, plot(Voltage~Datetime, type="l",  
               ylab="Voltage", xlab="datetime"))

##Graph 3
with(hhp, plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab=""))
with(hhp, lines(Sub_metering_2~Datetime,col='Red'))
with(hhp, lines(Sub_metering_3~Datetime,col='Blue')) 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,  
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

##Graph 4
with(hhp, plot(Global_reactive_power~Datetime, type="l"))

dev.off()
