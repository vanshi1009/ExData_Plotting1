#extracting the file
electricFile <- "E:/program_elective_2021/household_power_consumption.txt"

#getting the data 
full<- read.table(electricFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#taking only the specified data 
part <- full[full$Date %in% c("1/2/2007","2/2/2007") ,]


Power <- as.numeric(part$Global_active_power)

# as png

png("plot1.png", width=480, height=480)

#plotting1

hist(Power, main = "global active power", col = "red", ylab = "frequency", xlab = "global active power in kw")


dev.off()

