#extracting the file
electricFile <- "E:/program_elective_2021/household_power_consumption.txt"

#getting the data 
full<- read.table(electricFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#taking only the specified data 
part <- full[full$Date %in% c("1/2/2007","2/2/2007") ,]


#date conversion 
dt <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSetData$Global_active_power)

#png
png("plot2.png", width=480, height=480)

#plotting2
plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()