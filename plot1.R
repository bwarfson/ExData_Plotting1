source("main.R")

DT <- get.data()

png("plot1.png", width=400, height=400)
hist(DT$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()
