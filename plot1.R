my_file <- file("household_power_consumption.txt")
my_df   <- read.csv(my_file, sep = ';', na.strings = "?")

# identify the date column for filtering purposes
my_df$Date <- as.Date(my_df$Date, format = "%d/%m/%Y")

# subset the data
my_df_2 <- subset(my_df, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

# plot the requested histogram
hist(my_df_2$Global_active_power, col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")

# now export the plot from RStudio as a png at 480x480