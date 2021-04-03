#extracting the file
electricFile <- "E:/program_elective_2021/household_power_consumption.txt"

#getting the data 
full<- read.table(electricFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#taking only the specified data 
part <- full[full$Date %in% c("1/2/2007","2/2/2007") ,]

#date conversion 
kk <- strptime(paste(part$Date, part$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#active power

Power <- as.numeric(part$Global_active_power)
#metering

reading1 <- as.numeric(part$Sub_metering_1)
reading2 <- as.numeric(part$Sub_metering_2)
reading3 <- as.numeric(part$Sub_metering_3)
#reactive ppower
rpower<- as.numeric(part$Global_reactive_power)

#volage
jj <- as.numeric(part$Voltage)

#png
png("plot4.png", width=480, height=480)

#plotting 4 graphs on same window
par(mfrow = c(2, 2)) 

plot(kk, Power, type="l", xlab="", ylab="global_ActivePower", cex=0.4)

plot(kk, jj, type="l", ylab="Voltage", xlab="datetime")

plot(kk, reading1, type="l", ylab="Energy_sub", xlab="days")

lines(kk, reading2, type="l", col="red")


lines(kk, reading3, type="l", col="blue")

#labels and colours 
legend("topright", c("metering_1", "metering_2", "metering_3"),  col=c("black", "red", "blue"), bty="o", lty=1, lwd=2.5,)

plot(kk, Power, type="l", xlab="datetime", ylab="Globalreactivepower")

dev.off()