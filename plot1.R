######################################
# -- EDA Programming Assignment 1 -- #
# ------------ Plot 1 -------------- #
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
data$Date<-as.Date(data$Date,"%d / %m / %Y")

# - subsetting the data to only use the 2007-02-01 & 2007-02-02 - #
keep<- (data$Date==as.Date("01/02/2007","%d/%m/%Y") | 
              data$Date==as.Date("02/02/2007","%d/%m/%Y") )

data<-data[keep,]

png("ExData_Plotting1/plot1.png",width=480,height=480)

with(data,hist(Global_active_power,col="red",
               xlab="Global Active Power (kilowatts)",
               main="Global Active Power"))
dev.off()
