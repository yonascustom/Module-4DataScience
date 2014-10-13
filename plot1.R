#You must have the source file "household_power_consumption.txt"  in your workdir; getwd()        
#Read Data
Data <- read.table ("household_power_consumption.txt",header=T,sep=";")
#Create one column called Date2 and Change Datatype 
Data$Date2 <- as.Date(Data$Date,"%d/%m/%Y")
#Create a subset of data
SubsetData <- subset(Data, Date2 == "2007-02-01" | Date2 == "2007-02-02")
#Convert Column "Global_active_power" as numeric 
SubsetData$Global_active_power <- as.numeric(as.character(SubsetData$Global_active_power))
#Create Graphic
hist(SubsetData$Global_active_power , col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")	
# Copy my plot to a plot1.PNG file
dev.copy(png, file = "plot1.png" ,width = 480, height = 480)  
dev.off()