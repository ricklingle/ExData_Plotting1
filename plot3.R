##Plot 3
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

##Line plot, add 2 and 3 with lines
##create png file

png("plot3.png", width=480, height=480)
plot(g$Day, g$Sub_metering_1, type = "l", xlab="",
     ylab="Energy Sub metering", col="black")
lines(g$Day, g$Sub_metering_2, type = "l", col="red")
lines(g$Day, g$Sub_metering_3, type = "l", col="blue")

##add legend

legend("topright", lty=1, lwd=1, col=c("black", "red", "blue"), 
       legend=c("Sub_Metering1", "Sub_Metering2", "Sub_Metering3"))

dev.off()