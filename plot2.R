## Get all the data to subset to what we need
allData <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

#get the subset
hhp <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(hhp$Date), hhp$Time) 
hhp$Datetime <- as.POSIXct(datetime) 

png("plot2.png")
with(hhp, plot(hhp$Global_active_power~hhp$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="") )
dev.off()

