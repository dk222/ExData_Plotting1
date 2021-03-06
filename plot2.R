temp<-tempfile()
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data<-read.table(unz(temp, "household_power_consumption.txt"),sep=";")
unlink(temp)
feb1and2data<-data[data$V1=="1/2/2007"|data$V1=="2/2/2007",]
global.active.power<-as.numeric(as.character(feb1and2data[,3]))
merged.date.and.time<-paste(feb1and2data[,1],feb1and2data[,2])
date.and.time<-strptime(merged.date.and.time,format="%d/%m/%Y %H:%M:%S")
plot(date.and.time,global.active.power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()