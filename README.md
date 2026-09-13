# SportShop

SportShop là ứng dụng thương mại điện tử chuyên bán đồ thể thao. Dự án hỗ trợ hai nhóm người dùng chính: khách hàng mua sắm trên giao diện client và quản trị viên vận hành sản phẩm, đơn hàng, người dùng và danh mục trên giao diện admin.

## Overview

Ứng dụng được xây dựng theo mô hình Spring MVC, render giao diện phía server bằng JSP/JSTL và lưu trữ dữ liệu trong MySQL. Người dùng có thể duyệt và lọc sản phẩm, quản lý giỏ hàng, áp dụng voucher, đặt hàng bằng tiền mặt hoặc VNPay, sau đó theo dõi và cập nhật trạng thái đơn hàng.


## Kiến trúc

Dự án tổ chức theo các lớp chính:

```text
src/main/java/com/n11/sportshop/
├── config/         Cấu hình Spring MVC, Spring Security và xử lý đăng nhập
├── controller/     Controller cho giao diện client và admin
├── domain/         Entity JPA, enum và DTO
├── repository/     Spring Data JPA repository truy cập MySQL
├── service/        Nghiệp vụ sản phẩm, giỏ hàng, đơn hàng, người dùng, ảnh và thanh toán
└── SportshopApplication.java

src/main/webapp/
├── WEB-INF/view/   JSP cho giao diện client và admin
└── resources/      CSS, JavaScript, font và hình ảnh
```

## Công nghệ sử dụng

- **Java 17**
- **Spring Boot 3.3.13**
- Spring MVC và Spring Web
- Spring Data JPA, Hibernate và JPA Metamodel
- Spring Security với mã hóa mật khẩu BCrypt
- Spring Session JDBC
- JSP, JSTL và Apache Tomcat Jasper
- MySQL Connector/J
- Spring Validation
- VNPay Sandbox cho thanh toán trực tuyến
- Spring AMQP/RabbitMQ dependency cho khả năng tích hợp message broker
- Maven Wrapper (`mvnw`, `mvnw.cmd`)
- Docker và Docker Compose
- Bootstrap, jQuery và các thư viện giao diện được đặt trong `src/main/webapp/resources`

## Chức năng chính

### Khách hàng

- Xem trang chủ, danh sách sản phẩm và chi tiết sản phẩm.
- Tìm kiếm, phân trang và lọc sản phẩm theo thương hiệu, danh mục.
- Thêm sản phẩm vào giỏ hàng, cập nhật số lượng và xóa sản phẩm.
- Đăng ký, đăng nhập và phân quyền truy cập.
- Xem và cập nhật thông tin cá nhân, bao gồm ảnh đại diện.
- Nhận và sử dụng voucher được cấp cho tài khoản.
- Checkout với lựa chọn thanh toán tiền mặt hoặc VNPay.
- Xem đơn hàng theo trạng thái: đang chờ, đang giao, đã nhận hoặc đã hủy.
- Hủy đơn hàng hoặc xác nhận đã nhận hàng theo quy trình xử lý.

### Quản trị viên

- Xem dashboard với các thống kê tổng quan.
- Quản lý sản phẩm: thêm, xem, cập nhật, xóa mềm/tắt hoạt động và tải ảnh sản phẩm.
- Quản lý thương hiệu và danh mục.
- Quản lý voucher và loại giảm giá.
- Xem danh sách, lọc và xem chi tiết đơn hàng.
- Cập nhật trạng thái xử lý đơn hàng.
- Quản lý người dùng, cập nhật thông tin, khóa tài khoản và cấp voucher.


## Chạy dự án

### Chạy local bằng Maven Wrapper

Đảm bảo MySQL đang chạy và tạo database theo cấu hình trong `src/main/resources/application.properties`:

```sql
CREATE DATABASE ltw CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Sau đó chạy ứng dụng từ thư mục gốc dự án.

Trên Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

Trên Linux/macOS:

```bash
./mvnw spring-boot:run
```

Ứng dụng mặc định chạy tại:

```text
http://localhost:8080
```

### Build và chạy file WAR

Trên Windows:

```powershell
mvnw.cmd clean package -DskipTests
java -jar target\sportshop-0.0.1-SNAPSHOT.war
```

Trên Linux/macOS:

```bash
./mvnw clean package
java -jar target/sportshop-0.0.1-SNAPSHOT.war
```

### Chạy bằng Docker Compose


Khởi động:

```bash
docker compose up -d
```

Xem log ứng dụng:

```bash
docker compose logs -f app
```

Dừng các service:

```bash
docker compose down
```

Nếu cần build image từ mã nguồn thay vì sử dụng image có sẵn trong Compose:

```bash
docker build -t sportshop-app:latest .
```

Sau đó cập nhật thuộc tính `image` của service `app` trong `docker-compose.yml` thành `sportshop-app:latest` rồi chạy lại:

```bash
docker compose up -d
```


