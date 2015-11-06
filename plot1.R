temp<-tempfile()
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data<-read.table(unz(temp, "household_power_consumption.txt"),sep=";")
unlink(temp)
feb1and2data<-data[data$V1=="1/2/2007"|data$V1=="2/2/2007",]
global.active.power<-as.numeric(as.character(feb1and2data[,3]))
hist(global.active.power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red",ylim=c(0,1200))
dev.copy(png, file = "plot1.png")
dev.off()