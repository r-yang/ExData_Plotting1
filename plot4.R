## code for plot 4

plot4 <- function() {

## read a sub-set of data between Feb 1-2, 2007

data <- read.table("data.txt", sep=";", na.strings=c("?"), header=TRUE)

## add a new colunm representing date/time properly 

data$TD <- strptime(paste(data$Date, data$Time, sep=","),
                    format="%d/%m/%Y,%H:%M:%S")

## open a png file
png(file="plot4.png", height=480, width=480) 
## generate 4 pictures

par(mfrow = c(2, 2))  
with(data, {
  plot(data$TD, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")
  
  plot(data$TD, data$Voltage, type="l", ylab="Voltage",xlab="datetime")
  
  with(data, {
  plot(data$TD, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  ## bty="n" removes border 
  legend("topright", bty="n", lty="solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## plot three individual data. note that we have to use "points" instead of "plot"
  with(data, points(data$TD, data$Sub_metering_1, type="l", col="black"))
  
  with(data, points(data$TD, data$Sub_metering_2, type="l", col="red"))
  
  with(data, points(data$TD, data$Sub_metering_3, type="l", col="blue"))
  })
  plot(data$TD, data$Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")
  
})

## close the png file
dev.off()
}