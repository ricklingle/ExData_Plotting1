##Plot 1
##read data file, first 100000 rows
##change date format 
##assumes working directory is already set to file location

h<-read.csv("household_power_consumption.txt", header=TRUE, sep=";",
            stringsAsFactors=FALSE, dec=".", na.strings="?",nrows=100000)


h$Date<-as.Date(h$Date, format = "%d/%m/%Y")

##Subset data for desired dates

g<-h[(h$Date == "2007-02-01" | h$Date == "2007-02-02"),]

##historgram with color and title

hist(g$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

##save plot to png file

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()





