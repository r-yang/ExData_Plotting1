## code for plot 1

plot1 <- function() {

## read a sub-set of data between Feb 1-2, 2007

data <- read.table("data.txt", sep=";", na.strings=c("?"), header=TRUE)

## add a new colunm representing date/time properly 

data$TD <- strptime(paste(data$Date, data$Time, sep=","),
                    format="%d/%m/%Y,%H:%M:%S")

## open a png file
png(file="plot1.png", height=480, width=480) 
## generate a histogram 
hist(data$Global_active_power,  xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="red", main="Global Active Power")
## close the png file
dev.off()
}