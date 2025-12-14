# Mobile App Flutter – Nhóm 2

## Giới thiệu

**Mobile App Flutter – Nhóm 2** là ứng dụng tổng hợp các **bài tập Flutter** được xây dựng trong quá trình học môn **Lập trình Mobile**.  

Ứng dụng sử dụng **Flutter** để xây dựng giao diện và quản lý điều hướng giữa các màn hình thông qua **Drawer Menu & Navigation**.

Mỗi bài tập được thiết kế như **một màn hình (Screen) độc lập**, cho phép người dùng truy cập nhanh thông qua **Menu**.

---

## Công nghệ sử dụng

- **Flutter**
- **Dart**
- **Material Design**
- **Navigator & Routes**
- **Drawer Menu**
- **REST API (News API)**

---

## Cấu trúc thư mục chính

```text
lib/
├── model/                  # Model dữ liệu (Product, Article, ...)
├── screen/                 # Các màn hình (News List, News Detail, ...)
├── change_color_app.dart   # Bài tập đổi màu nền
├── counter_app.dart        # Bài tập Counter
├── gui_phan_hoi.dart       # Form gửi phản hồi
├── login_form.dart         # Form đăng nhập
├── signup_form.dart        # Form đăng ký
├── tinh_bmi.dart           # Tính chỉ số BMI
├── my_home_page.dart       # Trang chủ ứng dụng
├── tong_hop_bai_tap.dart   # Tổng hợp & menu các bài tập
└── main.dart               # Entry point của ứng dụng
```

---

## Danh sách các bài tập

| **STT** | **Tên bài tập** | **Mô tả** |
|---------|-----------------|-----------|
| 1 | Home Page | Giao diện trang chủ |
| 2 | My Place | Giao diện địa điểm |
| 3 | My Classroom | Giao diện lớp học |
| 4 | My Phone | Giao diện điện thoại |
| 5 | My Product | Giao diện sản phẩm |
| 6 | Đổi Màu Nền | Thay đổi màu nền ngẫu nhiên |
| 7 | Counter App | Ứng dụng đếm số |
| 8 | Login Form | Form đăng nhập |
| 9 | Sign Up Form | Form đăng ký |
| 10 | Tính BMI | Tính chỉ số BMI |
| 11 | Gửi Phản Hồi | Form gửi phản hồi người dùng |
| 12 | Tin Tức (News) | Lấy dữ liệu tin tức từ REST API |

---

## Điều hướng ứng dụng

- Ứng dụng sử dụng **Drawer Menu** để hiển thị danh sách bài tập
- Mỗi màn hình đều có:
  - **Menu** để chuyển nhanh giữa các bài tập
  - **Nút về Trang chủ**
- Điều hướng giữa các màn hình bằng **Navigator & Routes**

---

## Hướng dẫn chạy project

### 1️ Clone repository

```bash
git clone https://github.com/ntainguyenit/Mobile_App_Flutter.git
```

### 2️ Cài đặt các package

```bash
flutter pub get
```

### 3️ Chạy ứng dụng

```bash
flutter run
```

---

## Lưu ý về API

 **Vì lý do bảo mật, API key không được đẩy lên repository công khai.**

Người dùng cần tự cấu hình API key khi chạy project ở môi trường local.

---

## Ghi chú

- Cấu trúc code được tổ chức **rõ ràng**, dễ mở rộng và bảo trì.
- Nếu bạn thấy project hữu ích, hãy cho repository một **Star** nhé!

---

## Liên hệ

- **GitHub**: [ntainguyenit](https://github.com/ntainguyenit)
- **Repository**: [Mobile_App_Flutter](https://github.com/ntainguyenit/Mobile_App_Flutter)

---

**© 2025 Tai Nguyen, Mobile App Flutter – Nhóm 2. All rights reserved.**
