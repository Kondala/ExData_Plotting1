##################################################################################################################################
# Step 0:  Download and extract the data file (household_power_consumption.txt) into
#          a directory of choice and make that directory your working directory 
##################################################################################################################################
setwd("C:\\_2_1_Skills\\DataScience\\_4_Exploration\\Wk1Project")

##################################################################################################################################
# Step 1:  Read the data set and retain just the two days' data
##################################################################################################################################

full_data <- read.table("household_power_consumption.txt"
                        , sep = ";"
                        , header = TRUE
                        , stringsAsFactors=FALSE
                        , colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
                        , na.strings = c("?")
)
two_day_data <- full_data[which(full_data$Date %in% c("1/2/2007", "2/2/2007")),]

##################################################################################################################################
# Step 2:  Replace the Date and Time columns with a single DateTime formatted as a datetime object
#          Give the new column an appropriate name
##################################################################################################################################

two_day_data$DateTime <- strptime(paste(two_day_data$Date,two_day_data$Time), "%d/%m/%Y %H:%M:%S")
two_day_data <- cbind(two_day_data$DateTime, two_day_data[,3:9])
colnames(two_day_data)[1]= c("DateTime")

##################################################################################################################################
# Step 3:  create plot 2; type = "l" represents line plot
##################################################################################################################################

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(two_day_data$DateTime
     , two_day_data$Global_active_power
     , type = "l"
     , ylab = "Global Active Power (kilowatts)"
     , xlab = ""
     , col  = "black")

dev.off()