# Nhom7_CS417C
📌 Demo giao diện
![alt text](image.png)

⭐ Chức năng: Xem chi tiết sản phẩm (Product Detail)

Chức năng Xem chi tiết sản phẩm cho phép người dùng lựa chọn một sản phẩm từ danh sách và xem đầy đủ thông tin liên quan đến sản phẩm đó. Giao diện được thiết kế rõ ràng, trực quan, giúp người dùng dễ dàng nắm bắt thông tin.

🔍 Các nội dung hiển thị trong trang chi tiết sản phẩm gồm:

Ảnh đại diện sản phẩm

Tên sản phẩm

Giá bán

Mô tả chi tiết sản phẩm

Nút Thêm vào giỏ hàng để hỗ trợ quy trình mua sắm

🧩 Luồng hoạt động

Người dùng chọn một sản phẩm từ danh sách sản phẩm (Product List).

Hệ thống gửi ProductID sang trang Chi tiết sản phẩm.

Backend nhận ProductID, truy vấn CSDL để lấy toàn bộ thông tin liên quan.

Dữ liệu được hiển thị lên giao diện .aspx theo đúng bố cục.

Nếu người dùng nhấn Thêm vào giỏ hàng, hệ thống sẽ chuyển sang chức năng giỏ hàng để xử lý tiếp.

⚙️ Công nghệ sử dụng

ASP.NET WebForms

Frontend:

File .aspx (HTML + CSS + ASP.NET Controls)

Backend:

File .aspx.cs (Xử lý sự kiện, truy vấn CSDL, load dữ liệu)

Cơ sở dữ liệu: SQL Server

IDE khuyến nghị: Visual Studio 2017 hoặc mới hơn

🚀 Cách cài đặt & chạy

Clone hoặc download source code từ repository

Mở project bằng Visual Studio 2017 trở lên

Kiểm tra cấu hình Web.config (kết nối CSDL nếu dự án sử dụng database)

Nhấn IIS Express hoặc F5 để chạy dự án

Mở trang danh sách sản phẩm → chọn sản phẩm → xem chi tiết

👥 Thành viên thực hiện

Lê Văn Ngọc – Phụ trách xây dựng giao diện & lập trình chức năng xem chi tiết sản phẩm.

📩 Liên hệ

Email: levanngoc@dtu.edu.vn

