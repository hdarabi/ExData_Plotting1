myURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file( myURL, destfile = "proj1.zip")
unzip("proj1.zip")
TD <- read.table("household_power_consumption.txt", sep = ";", na.strings= '?', header=TRUE)
st <- TD[ TD$Date == '2/2/2007' | TD$Date == '1/2/2007', ]
png("plot4.png",width=480,height=480,units="px")
x <- factor( paste( st$Date, st$Time ) )
par(mfrow=c(2,2))
###Top Left Plot
plot(x , xaxt='n', st$Global_active_power, ylab="Global Active Power" )
lines( x, st$Global_active_power )
axis(1, at=c(x[1], x[length(x)/2 + 1],x[length(x)]),labels=c("Thu", "Fri", "Sat"), las=2)
#Top right plot
plot(x , xaxt='n', st$Voltage, ylab="Voltage", xlab="datetime" )
lines( x, st$Voltage )
axis(1, at=c(x[1], x[length(x)/2 + 1],x[length(x)]),labels=c("Thu", "Fri", "Sat"), las=2)
#Bottom left plot
plot(x = x, y = st$Sub_metering_1, ylab="Energy sub metering", xaxt='n' )
lines( x, st$Sub_metering_1 , col="black" )
lines( x, st$Sub_metering_2 , col="red" )
lines( x, st$Sub_metering_3 , col="blue" )
axis(1, at=c(x[1], x[length(x)/2 + 1],x[length(x)]),labels=c("Thu", "Fri", "Sat"), las=2)
legend("topright", lwd=2, box.col=NA, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"))
box(which = "plot", lty = "solid")
#Bottom right plot
plot(x , xaxt='n', st$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime" )
lines( x, st$Global_reactive_power )
axis(1, at=c(x[1], x[length(x)/2 + 1],x[length(x)]),labels=c("Thu", "Fri", "Sat"), las=2)
dev.off()

