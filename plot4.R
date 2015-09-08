##Plot 4
##read data file, first 100000 rows
##change date format 
##assumes working directory is already set to file location

h<-read.csv("household_power_consumption.txt", header=TRUE, sep=";",
            stringsAsFactors=FALSE, dec=".", na.strings="?",nrows=100000)


h$Date<-as.Date(h$Date, format = "%d/%m/%Y")

##Subset data for desired dates

g<-h[(h$Date == "2007-02-01" | h$Date == "2007-02-02"),]
rm(h)

##create combined date column, POSIXct format

g$Day<-as.POSIXct(paste(g$Date, g$Time, sep = " "))

##Four plots, 2x2, first two as plot 2 (new label) and 3, 
##line plot for new graphs, labels per example

##create png file

png("plot4.png", width=480, height=480)

par(mfcol=c(2,2))

with(g,{
##1
plot(g$Day, g$Global_active_power, type = "l", xlab="",
     ylab="Global Active Power")

##2
plot(g$Day, g$Sub_metering_1, type = "l", xlab="",
     ylab="Energy Sub metering", col="black")
lines(g$Day, g$Sub_metering_2, type = "l", col="red")
lines(g$Day, g$Sub_metering_3, type = "l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black", "red", "blue"), 
       legend=c("Sub_Metering1", "Sub_Metering2", "Sub_Metering3"))

##3
plot(g$Day, g$Voltage, type = "l", xlab="datetime",
     ylab="Voltage")

##4
plot(g$Day, g$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

})

dev.off()