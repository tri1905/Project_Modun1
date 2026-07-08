# 1. Đọc dữ liệu (Lọc dấu phân tách ";" và ký tự khuyết "?")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

# 2. Lọc dữ liệu đúng 2 ngày theo yêu cầu để tăng tốc độ xử lý
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# 3. Mở thiết bị vẽ PNG với kích thước chuẩn 480x480 pixel
png("plot1.png", width = 480, height = 480)

# 4. Vẽ biểu đồ Histogram (ép kiểu số để biểu đồ mượt và chuẩn)
hist(as.numeric(data_subset$Global_active_power), 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# 5. Đóng thiết bị vẽ để lưu file ảnh
dev.off()