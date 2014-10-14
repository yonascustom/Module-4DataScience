#Downloading file
Url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("./exdata-data-household_power_consumption.zip"))
{ download.file(Url, destfile = "./exdata-data-household_power_consumption.zip") }
#Unzip file
unzip("./exdata-data-household_power_consumption.zip")
#You must have the source file "household_power_consumption.txt"  in your workdir; getwd()        
#Read Data
Data <- read.table ("household_power_consumption.txt",header=T,sep=";")
#Create one column called Date2 and Change Datatype 
Data$Date2 <- as.Date(Data$Date,"%d/%m/%Y")
#Create a subset of data
SubsetData <- subset(Data, Date2 == "2007-02-01" | Date2 == "2007-02-02")

#Paste DateTime
SubsetData$DateTime <-  paste(SubsetData$Date, SubsetData$Time)
SubsetData$DateTime <-  strptime(SubsetData$DateTime , "%d/%m/%Y %H:%M:%S")

#Define Margins between graphs
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#Plot 2
SubsetData$Global_active_power <- as.numeric(as.character(SubsetData$Global_active_power))
plot(SubsetData$DateTime ,SubsetData$Global_active_power,type="n",ylab="Global Active Power (kilowatts)", xlab="")
lines(SubsetData$DateTime ,SubsetData$Global_active_power)

#Plot Voltage
SubsetData$Voltage <- as.numeric(as.character(SubsetData$Voltage))
plot(SubsetData$DateTime ,SubsetData$Voltage,type="n",ylab="Voltage")
lines(SubsetData$DateTime ,SubsetData$Voltage)

#Plot 3 Columns Sub_metering_1-3 as.numeric
SubsetData$Sub_metering_1 <- as.numeric(as.character(SubsetData$Sub_metering_1))
SubsetData$Sub_metering_2 <- as.numeric(as.character(SubsetData$Sub_metering_2))
SubsetData$Sub_metering_3 <- as.numeric(as.character(SubsetData$Sub_metering_3))
        #"Drawing 3 Graphs Together"
plot(SubsetData$DateTime , SubsetData$Sub_metering_1,type="n",ylab="Energy Sub Metering",xlab="")
lines(SubsetData$DateTime ,SubsetData$Sub_metering_1, col="black")
lines(SubsetData$DateTime ,SubsetData$Sub_metering_2, col="red")
lines(SubsetData$DateTime ,SubsetData$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1),  col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Plot Global Reactive
SubsetData$Global_reactive_power <- as.numeric(as.character(SubsetData$Global_reactive_power))
plot(SubsetData$DateTime ,SubsetData$Global_reactive_power,type="n",ylab="Global reactive power")
lines(SubsetData$DateTime ,SubsetData$Global_reactive_power)
dev.copy(png, file = "plot4.png" ,width = 480, height = 480)  ## Copy my plot to a plot4.PNG file
dev.off()


# Copy Screen to a plot4.PNG file
dev.copy(png, file = "plot4.png" ,width = 480, height = 480)  
dev.off()
