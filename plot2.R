# 1. Đọc và lọc dữ liệu
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# 2. Ép kiểu dữ liệu thời gian chuẩn
data_subset$DateTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format = "%d/%m/%Y %H:%M:%S")

# 3. Tạo mốc tọa độ dạng số cho trục X (bắt đầu ngày 1, ngày 2 và ngày 3)
tick_times <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"))
tick_positions <- as.numeric(tick_times)

# 4. Mở thiết bị vẽ PNG
png("plot2.png", width = 480, height = 480)

# 5. Vẽ biểu đồ đường và TẮT trục X tự động (xaxt = "n")
plot(as.numeric(data_subset$DateTime), data_subset$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     xaxt = "n")

# 6. Tự vẽ lại trục X hiển thị chính xác các Thứ (Thu, Fri, Sat)
axis(1, at = tick_positions, labels = c("Thu", "Fri", "Sat"))

dev.off()