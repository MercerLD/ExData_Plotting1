######################################
# -- EDA Programming Assignment 1 -- #
# ------------ Plot 3 -------------- #
######################################
setwd("~/Dropbox/Coursera/EDA/")

# -- reading in the data -- #
tabrows <- read.table("Data/household_power_consumption.txt",sep=";",
                       header = TRUE, nrows = 50000,na.strings="?")
classes <- sapply(tabrows, class)

system.time({
      data <- read.table("Data/household_power_consumption.txt",sep=";",
                            header = TRUE, nrows = 22e5,colClasses=classes,
                         na.strings="?")
}) # takes about 19 seconds to read in


# - fixing up the dates - #
data$DateNew<-paste(data$Date,data$Time)
data$DateNEW<-strptime(data$DateNew,"%d / %m / %Y %H:%M:%S")

# - subsetting the data to only use the 2007-02-01 & 2007-02-02 - #
# - fixing up the dates - #
data$Date<-as.Date(data$Date,"%d / %m / %Y")
keep<- (data$Date==as.Date("01/02/2007","%d/%m/%Y") | 
              data$Date==as.Date("02/02/2007","%d/%m/%Y") )

data<-data[keep,]

png("ExData_Plotting1/plot3.png",width=480,height=480)

with(data,plot(DateNEW,Sub_metering_1,xlab="",col="black",
               ylab="Energy sub metering",type="l"))
with(data,points(DateNEW,Sub_metering_2,xlab="",col="red",
               ylab="Energy sub metering",type="l"))
with(data,points(DateNEW,Sub_metering_3,xlab="",col="blue",
               ylab="Energy sub metering",type="l"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c(1,2,4),lty=1)
dev.off()
