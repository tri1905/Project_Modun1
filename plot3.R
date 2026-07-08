# 1. Đọc và lọc dữ liệu
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data_subset$DateTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format = "%d/%m/%Y %H:%M:%S")

# 2. Tạo mốc tọa độ dạng số cho trục X
tick_times <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"))
tick_positions <- as.numeric(tick_times)

# 3. Mở thiết bị vẽ PNG
png("plot3.png", width = 480, height = 480)

# 4. Vẽ đường đầu tiên (Sub_metering_1 - màu đen) và tắt trục X mặc định
plot(as.numeric(data_subset$DateTime), data_subset$Sub_metering_1, 
     type = "l", col = "black", xlab = "", ylab = "Energy sub metering", xaxt = "n")

# 5. Vẽ đè đường số 2 (màu đỏ) và số 3 (màu xanh)
lines(as.numeric(data_subset$DateTime), data_subset$Sub_metering_2, col = "red")
lines(as.numeric(data_subset$DateTime), data_subset$Sub_metering_3, col = "blue")

# 6. Tự vẽ lại trục X hiển thị Thứ
axis(1, at = tick_positions, labels = c("Thu", "Fri", "Sat"))

# 7. Thêm bảng chú thích ở góc trên bên phải (Có khung viền mặc định theo mẫu)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1)

dev.off()