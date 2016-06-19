## Get all the data to subset to what we need
allData <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

#get the subset
hhp <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot1.png", width = 480, height = 480)
hist(hhp$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
dev.off()

