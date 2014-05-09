myURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file( myURL, destfile = "proj1.zip")
unzip("proj1.zip")
TD <- read.table("household_power_consumption.txt", sep = ";", na.strings= '?', header=TRUE)
st <- TD[ TD$Date == '2/2/2007' | TD$Date == '1/2/2007', ]
png("plot2.png",width=480,height=480,units="px")
x <- factor( paste( st$Date, st$Time ) )
plot(x , xaxt='n', st$Global_active_power, ylab="Global Active Power (kilowatts)" )
lines( x, st$Global_active_power )
axis(1, at=c(x[1], x[length(x)/2 + 1],x[length(x)]),labels=c("Thu", "Fri", "Sat"), las=2)
dev.off()
