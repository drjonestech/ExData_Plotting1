pow <-read.table("C:/Users/CrisWin/Documents/Exploratory Data Analysis/household_power_consumption.txt", header = T, sep=";")
pow$Date <-as.Date(pow$Date, format = "%d/%m/%Y")
df <-pow[(pow$Date =="2007-02-01")|(pow$Date =="2007-02-02"),]
df$Global_active_power <-as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <-as.numeric(as.character(df$Global_reactive_power))
df$Voltage <-as.numeric(as.character(df$Voltage))
df <-transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <-as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <-as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <-as.numeric(as.character(df$Sub_metering_3)) 

plot2 <-function(){
  plot(df$timestamp, df$Global_active_power, type ="l",xlab="", ylab="Global Active Power(Kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("Plot2.png has been saved in ", getwd())
}