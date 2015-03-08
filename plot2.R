source("main.R")

DT <- get.data()
png("plot2.png", width=400, height=400)
plot(DT$DateTime,DT$Global_active_power,type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
