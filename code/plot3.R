#skip the lines using skipby calculating number of mins between first row and begining of feb
#use nrows to claculate number of rows to be read

dt<-read.table("household_power_consumption.txt",header=FALSE,sep=";",na.strings="?",colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip=60*24*46+6*60+37, nrows=2*24*60)

#copy the names
n <- read.table("household_power_consumption.txt",header=TRUE,sep=";", nrows=1)
names(dt) <- names(n)

with (dt, {
  # convert date/time
  d <- as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")

  #create the graph with sub metering1
  plot(d,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
  
  #add sub metering 2 & 3
  points(d,Sub_metering_2,type="l",col="red")
  points(d,Sub_metering_3,type="l",col="blue")
  
  legend("topright",col=c("black","red","blue"),lty=c(1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
})

#save as png
dev.copy(png,file="plot3.png")
dev.off()
