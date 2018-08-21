#plot1
setwd("C:/Users/zhangx01/Documents/data science")
dataEPC=read.table("household_power_consumption.txt",header = T,sep =";",stringsAsFactors = F)
dataEPC=dataEPC[which(dataEPC[,1]=="1/2/2007"|dataEPC[,1]=="2/2/2007"),]
png(filename ="plot1.png",width = 480,height = 480,units = "px")
hist(as.numeric(dataEPC$Global_active_power),xlab ="Global Active Power (kilowatt)", main ="Global Active Power", col = "red")
dev.off()


#plot2
Sys.setlocale(category="LC_ALL", locale="english")
dataEPC$Date=as.Date(dataEPC$Date, format ="%d/%m/%Y")
dataEPC$weekday=as.POSIXct(paste(dataEPC$Date, dataEPC$Time))
png(filename ="plot2.png",width = 480,height = 480,units = "px")
plot(dataEPC$weekday,dataEPC$Global_active_power, xlab ="", ylab ="Global Active Power (kilowatt)",type = "l")
dev.off()


#plot3
png(filename ="plot3.png",width = 480,height = 480,units = "px")
plot(dataEPC$weekday, dataEPC$Sub_metering_1, xlab ="", ylab ="Energy sub metering", type ="l")
lines(dataEPC$weekday, dataEPC$Sub_metering_2, col ="red")
lines(dataEPC$weekday, dataEPC$Sub_metering_3, col ="blue")
legend("topright", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1)
dev.off()


#plot4
png(filename ="plot4.png",width = 480,height = 480,units = "px")
par(mfrow = c(2,2))
plot(dataEPC$weekday, dataEPC$Global_active_power, xlab ="", ylab ="Global Active Power (kilowatt)", type ="l")
plot(dataEPC$weekday, dataEPC$Voltage, xlab ="datetime", ylab ="Voltage", type ="l")
plot(dataEPC$weekday, dataEPC$Sub_metering_1, xlab ="", ylab ="Energy sub metering", type ="l")
lines(dataEPC$weekday, dataEPC$Sub_metering_2, col ="red")
lines(dataEPC$weekday, dataEPC$Sub_metering_3, col ="blue")
legend("topright", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1)
plot(dataEPC$weekday, dataEPC$Global_reactive_power, xlab ="datetime", ylab ="Global_reactive_power", type ="l")
dev.off()


