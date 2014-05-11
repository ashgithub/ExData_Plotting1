#skip the lines using skipby calculating number of mins between first row and begining of feb
#use nrows to claculate number of rows to be read

dt<-read.table("household_power_consumption.txt",header=FALSE,sep=";",na.strings="?",colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip=60*24*46+6*60+37, nrows=2*24*60)

#copy the names
n <- read.table("household_power_consumption.txt",header=TRUE,sep=";", nrows=1)
names(dt) <- names(n)


#setup 2x2 grid for plots
par(mfrow=c(2,2))

with (dt, {
  # convert date/time
  datetime <- as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")

  # chart 1: global active power
  plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  #chart 2: voltage
  plot(datetime,Voltage,type="l")
 
  # chart 3 : submetering
  plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
  points(datetime,Sub_metering_2,type="l",col="red")
  points(datetime,Sub_metering_3,type="l",col="blue")  
  #legend("topright",col=c("black","red","blue"),lty=c(1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # chart 4: global reactive power
  plot(datetime,Global_reactive_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
})

#save as png
dev.copy(png,file="plot4.png")
dev.off()
