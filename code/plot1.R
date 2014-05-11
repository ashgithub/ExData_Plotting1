#skip the lines using skipby calculating number of mins between first row and begining of feb
#use nrows to claculate number of rows to be read

dt<-read.table("household_power_consumption.txt",header=FALSE,sep=";",na.strings="?",colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip=60*24*46+6*60+37, nrows=2*24*60)

#copy the names
n <- read.table("household_power_consumption.txt",header=TRUE,sep=";", nrows=1)
names(dt) <- names(n)

#create the histogram
hist(dt$Global_active_power,main = "Global Active Power", xlab="Global Active Power(kilowatts)",col="red")

#save as png
dev.copy(png,file="plot1.png")
dev.off()