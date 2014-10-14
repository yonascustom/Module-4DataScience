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

#Convert Column "Global_active_power" as numeric 
SubsetData$Global_active_power <- as.numeric(as.character(SubsetData$Global_active_power))
#Create Graphic
#hist(SubsetData$Global_active_power , col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")	

plot(SubsetData$DateTime ,SubsetData$Global_active_power,type="n",ylab="Global Active Power (kilowatts)", xlab="")
lines(SubsetData$DateTime ,SubsetData$Global_active_power)

# Copy my plot to a plot1.PNG file
dev.copy(png, file = "plot2.png" ,width = 480, height = 480)  
dev.off()