#extracting the file
electricFile <- "E:/program_elective_2021/household_power_consumption.txt"
#getting the data 
full<- read.table(electricFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#taking only the specified data 
part <- full[full$Date %in% c("1/2/2007","2/2/2007") ,]
#date conversion 

xy <- strptime(paste(part$Date, part$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Power <- as.numeric(part$Global_active_power)
reading1 <- as.numeric(part$Sub_metering_1)
reading2 <- as.numeric(part$Sub_metering_2)
reading3 <- as.numeric(part$Sub_metering_3)
#png
png("plot3.png", width=480, height=480)

#plotting 3rd graph 
plot(xy, reading1, type="l", xlab="days",ylab="energy_submetering")
lines(xy,reading2, type="l", col="red")
lines(xy, reading3, type="l", col="blue")

#labelling
legend("topright", lty=2, lwd=3.5, col=c("black", "red", "blue"), c("Submetering1", "Submetering2", "Submetering3"))
dev.off()