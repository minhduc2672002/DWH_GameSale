# Xây dựng Kho Dữ Liệu Doanh Số Game Khai Thác Tại Công Ty Phân Phối Game

## 1.Giới thiệu về đồ án:
### 1.1.Nội dung của đồ án
``` Phân tích, thiết kế, chuyển đổi dữ liệu database gốc sang nhà Kho dữ liệu```

### 1.2.Mục tiêu của đò án
```
Nắm được cách phân tích thiết kế Data Warehouse theo nhu cầu phân tích dữ liệu
Nắm được kỹ thuật tích hợp dữ liệu từ các nguồn về Data Warehouse
Nắm được kỹ thuật phân tích bằng SSAS
```
### 1.3.Công cụ và nền tảng kỹ thuật thực hiện đồ án
```
Các công cụ chính sử dụng trong đồ án này là 
+ Microsoft SQL Server 
+ SSAS
+ SSIS
+ Power BI
```
## 2.Thiết kế kho dữ liệu
### 2.1 Ý tưởng
```
Ý tưởng: Xây dựng 1 Data Warehouse dưới dạng mô hình Star Schema có các Dim table (chứa các đối tượng cần phân tích) và Fact table (chứa các id của các đối tượng và 1 cột chứa giá trị được group by từ các id)
```

