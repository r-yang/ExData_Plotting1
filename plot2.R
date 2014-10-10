## code for plot 2

plot2 <- function() {

## read a sub-set of data between Feb 1-2, 2007

data <- read.table("data.txt", sep=";", na.strings=c("?"), header=TRUE)

## add a new colunm representing date/time properly 

data$TD <- strptime(paste(data$Date, data$Time, sep=","),
                    format="%d/%m/%Y,%H:%M:%S")

## open a png file
png(file="plot2.png", height=480, width=480) 

## generate 2nd plot  (this is only different line compared from plot1)

with(data, plot(data$TD, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab=""))

## close the png file
dev.off()
}