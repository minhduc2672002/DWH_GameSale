# Xây dựng Kho Dữ Liệu Doanh Số Game Khai Thác Tại Công Ty Phân Phối Game

# 1 Giới thiệu về đồ án
### 1.1 Nội dung của đồ án
Phân tích, thiết kế, chuyển đổi dữ liệu database gốc sang nhà Kho dữ liệu

### 1.2 Mục tiêu của đò án
Nắm được cách phân tích thiết kế Data Warehouse theo nhu cầu phân tích dữ liệu

Nắm được kỹ thuật tích hợp dữ liệu từ các nguồn về Data Warehouse

Nắm được kỹ thuật phân tích bằng SSAS
### 1.3 Công cụ và nền tảng kỹ thuật thực hiện đồ án
Các công cụ chính sử dụng trong đồ án này là 
+ Microsoft SQL Server 
+ SSAS
+ SSIS
+ Power BI
  
# 2.Thiết kế kho dữ liệu
### 2.1 Ý tưởng

Ý tưởng: Xây dựng 1 Data Warehouse dưới dạng mô hình Star Schema có các Dim table (chứa các đối tượng cần phân tích) và Fact table (chứa các id của các đối tượng và 1 cột chứa giá trị được group by từ các id)

### 2.2 Thiết kế Stage
```
region(id, region_name)
genre(id, genre_name)
publisher(id, publisher_name)
platform(id, platform_name)
game(id, genre_id, game_name)
game_publisher(id, game_id, publisher_id)
game_platform(id, game_publisher_id, platform_id, release_year)
region_sales(region_id, game_platform_id, num_sales)

```
![Stage](https://github.com/minhduc2672002/DWH_GameSale/assets/133132824/2a45579d-3e95-4b2e-88ba-3e3e8cb7bfd4)

### 2.2 Thiết kế Warehouse
```
Dim:
DimRegion: Dim về khu vực/thị trường bán game
DimGerne: Dim về thể loại game
DimPublisher: Dim về nhà phát hành
DimPlatform: Dim về nền tảng phát triển
DimGame: Dim về game
DimYear: Dim về năm phát hành

Có 1 fact:
Fact doanh thu = sum(num_sales) group by (id DimRegion, id DimGerne, id DimPublisher, id DimPlatform, id DimGame, id DimYear)

```
![DWH](https://github.com/minhduc2672002/DWH_GameSale/assets/133132824/75962bd7-e0df-47a1-984f-aa5950a983f4)

*Các bước tiếp theo bao gồm ETL, Phân tích, Tạo báo cáo bằng BI vui lòng xem đầy đủ ở file Word ở mục Report xin cảm ơn!*
