

#READ THE DATA:
#Note that in this dataset missing values are coded as "?"
#We will only be using data from the dates 2007-02-01 and 2007-02-02 read the data from just those dates
#	Date field is in format dd/mm/yyyy

data <- subset(read.csv("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?"),Date%in%c("1/2/2007","2/2/2007"))

#CONVERT THE DATE AND TIME FIELDS

## DATE
data$zDate <- as.Date(data[,1],"%d/%m/%Y")

## TIME
# paste(data[,1],data[,2],sep=" ")  		<= this will concatenate the Date and Time columns
# strptime(x,format="%d/%m/%Y %H:%M:%S")	<= this will convert Date & Time columns into time format

data$zTime <- strptime(paste(data[,1],data[,2],sep=" "),format="%d/%m/%Y %H:%M:%S")


## open target png file
png(filename="plot3.png")

# create plot
plot(data$zTime,data$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(data$zTime,data$Sub_metering_2,type="l",col="red")
lines(data$zTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

## close png file
dev.off()
