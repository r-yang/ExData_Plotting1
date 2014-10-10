## code for plot 3

plot3 <- function() {

## read a sub-set of data between Feb 1-2, 2007

data <- read.table("data.txt", sep=";", na.strings=c("?"), header=TRUE)

## add a new colunm representing date/time properly 

data$TD <- strptime(paste(data$Date, data$Time, sep=","),
                    format="%d/%m/%Y,%H:%M:%S")

## open a png file
png(file="plot3.png", height=480, width=480) 

## generate the 3rd plot  

## open an empty template and set legend
with(data, plot(data$TD, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))

legend("topright", lty="solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot three individual data. note that we have to use "points" instead of "plot"
with(data, points(data$TD, data$Sub_metering_1, type="l", col="black"))

with(data, points(data$TD, data$Sub_metering_2, type="l", col="red"))

with(data, points(data$TD, data$Sub_metering_3, type="l", col="blue"))
## close the png file
dev.off()
}