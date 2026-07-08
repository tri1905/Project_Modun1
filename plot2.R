
# tiền xử lý số liệu
# 1. Đọc dữ liệu (Lưu ý dấu phân tách ";" và ký tự khuyết "?")
data <- read.csv2("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE)

# 2. Lọc dữ liệu đúng 2 ngày theo yêu cầu của dự án trước để tăng tốc độ xử lý
# Định dạng ngày trong file gốc lúc này đang là d/m/Y (ví dụ: 1/2/2007)
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# 3. Gộp và ép kiểu sang POSIXct (Thêm hàm as.POSIXct bọc ngoài strptime)
data_subset$DateTime <- as.POSIXct(strptime(paste(data_subset$Date, data_subset$Time), 
                                            format = "%d/%m/%Y %H:%M:%S"))

# 4. Mẹo ép hệ thống hiển thị Thứ bằng tiếng Anh (Bắt buộc để biểu đồ ra chữ Thu, Fri, Sat)
Sys.setlocale("LC_TIME", "English")


