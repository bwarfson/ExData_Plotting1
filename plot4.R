source("main.R")

DT <- get.data()
png("plot4.png", width=800, height=800)
par(mfrow=c(2,2))

hist(DT$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "")

plot(DT$DateTime,DT$Voltage,type="l", xlab="datetime",ylab="Voltage")

plot(DT$DateTime,DT$Sub_metering_1,type="l", xlab="",ylab="Energy sub metering")
lines(DT$DateTime,DT$Sub_metering_2, col="red")
lines(DT$DateTime,DT$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)

plot(DT$DateTime,DT$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power")

dev.off()
