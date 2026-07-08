# 1. Đọc và lọc dữ liệu
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data_subset$DateTime <- as.POSIXct(paste(data_subset$Date, data_subset$Time), format = "%d/%m/%Y %H:%M:%S")

# 2. Tạo mốc tọa độ dạng số cho trục X
tick_times <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"))
tick_positions <- as.numeric(tick_times)

# 3. Mở thiết bị vẽ PNG
png("plot4.png", width = 480, height = 480)

# 4. Thiết lập lưới đồ họa gồm 2 hàng và 2 cột (Tổng cộng 4 hình)
par(mfrow = c(2, 2))

# --- [Hình con 1: Góc trên - bên trái] ---
plot(as.numeric(data_subset$DateTime), data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", xaxt = "n")
axis(1, at = tick_positions, labels = c("Thu", "Fri", "Sat"))

# --- [Hình con 2: Góc trên - bên phải] ---
plot(as.numeric(data_subset$DateTime), data_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = tick_positions, labels = c("Thu", "Fri", "Sat"))

# --- [Hình con 3: Góc dưới - bên trái] ---
plot(as.numeric(data_subset$DateTime), data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(as.numeric(data_subset$DateTime), data_subset$Sub_metering_2, col = "red")
lines(as.numeric(data_subset$DateTime), data_subset$Sub_metering_3, col = "blue")
axis(1, at = tick_positions, labels = c("Thu", "Fri", "Sat"))
# Lưu ý: Thêm bty = "n" để XÓA VIỀN hộp chú thích theo đúng chuẩn mẫu hình 4 của giáo viên
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty = "n")

# --- [Hình con 4: Góc dưới - bên phải] ---
plot(as.numeric(data_subset$DateTime), data_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis(1, at = tick_positions, labels = c("Thu", "Fri", "Sat"))

dev.off()