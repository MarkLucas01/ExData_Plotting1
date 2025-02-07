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
plot(my_df_2$Global_active_power ~ my_df_2$DateTime, type="s",
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Now export the plot from RStudio as a png at 480x480

# Here, the plot tells us about the fluctuations of power consumption over the 2 day period