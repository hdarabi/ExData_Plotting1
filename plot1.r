myURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file( myURL, destfile = "proj1.zip")
unzip("proj1.zip")
TD <- read.table("household_power_consumption.txt", sep = ";", na.strings= '?', header=TRUE)
st <- TD[ TD$Date == '2/2/2007' | TD$Date == '1/2/2007', ]
png("plot1.png",width=480,height=480,units="px")
h <- hist(st$Global_active_power, col="red", xlab="Global Avtive Power (kilowatts)" , main = "Global Avtive Power" )
dev.off()
