data_to_delete <- read.csv("./household_power_consumption.txt", header = T,sep = ";")

data_to_delete$Date <- as.Date(data_to_delete$Date, format="%d/%m/%Y")

condition1 <- "2007-02-01"
condition2 <- "2007-02-02"
dataa <- data_to_delete[data_to_delete$Date <- condition1 | data_to_delete$Date <- condition2]
rm(data_to_delete)

DateTime <- paste(as.Date(dataa$Date),dataa$Time)
dataa$Datetime <- as.POSIXct(DateTime)

png("plot4.png", width = 800, height = 600, res = 100)
par(mfrow=c(2,2))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()

