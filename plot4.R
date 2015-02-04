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

# identify the layout of the 4 plots
par(mfrow=c(2,2))

# plot the 4 requested plots...

# plot 1 (similar to plot2.R - global active power over time)
plot(my_df_2$Global_active_power ~ my_df_2$DateTime, type="s", 
     ylab = "Global Active Power", xlab = "")

# plot 2 (voltage over time)
plot(my_df_2$Voltage ~ my_df_2$DateTime, type="s", ylab="Voltage", xlab="datetime")

# plot 3 (similar to plot3.R - energy sub metering over time)
plot(my_df_2$Sub_metering_1 ~ my_df_2$DateTime, col = 'Black',
     type="s", xlab = "", ylab = "Energy sub metering")
lines(my_df_2$Sub_metering_2 ~ my_df_2$DateTime, col = 'Red')
lines(my_df_2$Sub_metering_3 ~ my_df_2$DateTime, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 4 (global reactive power over time)
plot(my_df_2$Global_reactive_power ~ my_df_2$DateTime, type="s", 
     ylab = "Global_reactive_power", xlab = "datetime")


# Now export the plot from RStudio as a png at 480x480

# Here, the plots illustrate the changes to the 4 variables over the 2 day period