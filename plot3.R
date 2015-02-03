# load the individual household electric power consumption data set
my_file <- file("household_power_consumption.txt")
my_df   <- read.csv(my_file, sep = ';', na.strings = "?")

# identify the date column for filtering purposes
my_df$Date <- as.Date(my_df$Date, format = "%d/%m/%Y")

# subset the data
my_df_2 <- subset(my_df, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

# Add a Datetime column for the plot's x-axis
x <- paste(my_df_2$Date, my_df_2$Time)
my_df_2$DateTime <- as.POSIXct(x)

# plot the requested plot
plot(my_df_2$Sub_metering_1 ~ my_df_2$DateTime, col = 'Black',
     type = "s", xlab = "", ylab = "Energy sub metering")
lines(my_df_2$Sub_metering_2 ~ my_df_2$DateTime, col = 'Red')
lines(my_df_2$Sub_metering_3 ~ my_df_2$DateTime, col = 'Blue')

legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Now export the plot from RStudio as a png at 480x480

# Here, the plot tells us about the fluctuations of power consumption over the 2 day period
# while distinguishing (visually) sub metering 1, 2 and 3 in black/red/blue