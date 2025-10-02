library(plyr)
dt <- read.csv("./household_power_consumption.txt")
head(dt)
dataa <- data.frame(Date = 0,
                    Time = 0,
                    Global_active_power = 0,
                    Global_reactive_power = 0,
                    Voltage = 0,
                    Global_intensity = 0,
                    Sub_metering_1 = 0,
                    Sub_metering_2 = 0,
                    Sub_metering_3 = 0)

for (i in 66637:69516){
  
  splito <- unlist(strsplit(dt[i,1], split = ";"))
  dataa <- rbind(dataa, splito)
}
dataa <- dataa[-1,]
datetime <- paste(as.Date(dataa$Date), dataa$Time)
dataa$Datetime <- as.POSIXct(datetime)
png("plot1.png", width = 800, height = 600, res = 100)
hist(data1$Global_active_power, col="red", ylim=c(0,1200), xlab = "Global Active power (Kilowatts)")
dev.off()

