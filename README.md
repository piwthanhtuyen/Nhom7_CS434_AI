# Nhom7_CS434AI
1. Giới thiệu

Module Giỏ hàng (Cart) xử lý toàn bộ quá trình quản lý giỏ hàng của khách khi mua sản phẩm trên website.
Được xây dựng bằng ASP.NET WebForms, module hỗ trợ:

Thêm sản phẩm vào giỏ

Hiển thị danh sách sản phẩm đang có trong giỏ

Cập nhật số lượng sản phẩm

Xóa sản phẩm

Tính tổng giá trị đơn

Điều hướng sang trang Thanh toán

Gán giỏ hàng tạm cho tài khoản sau khi người dùng đăng nhập

Module hoạt động dựa trên Session, sử dụng SQL Server để lưu dữ liệu.

2.Cấu trúc file
Cart.aspx           // Giao diện người dùng (UI)
Cart.aspx.cs        // Code-behind xử lý logic giỏ hàng
Main.Master         // File master chứa layout chung

3. Luồng hoạt động giỏ hàng
✔️ 3.1 Khi tải trang (Page_Load)

Nếu chưa có CartId trong Session → tạo giỏ mới

Nếu người dùng đã đăng nhập → gán giỏ hàng tạm cho tài khoản

Load toàn bộ sản phẩm trong giỏ

✔️ 3.2 Load sản phẩm (LoadCartItems)

JOIN bảng CartItems + Products

Hiển thị lên GridView

Tính tổng tiền giỏ hàng bằng UpdateTotalPrice()

✔️ 3.3 Cập nhật số lượng (btnUpdateCart_Click)

Lặp qua từng hàng trong GridView

Lấy số lượng từ TextBox txtQuantity

Update ngược vào database

Load lại giỏ hàng

UPDATE CartItems SET Quantity = @quantity WHERE Id = @cartItemId

✔️ 3.4 Xóa sản phẩm (gvCart_RowCommand)

Khi nhấn nút “Xóa”

Lấy CartItemId từ CommandArgument

Xóa khỏi DB

Load lại giỏ

DELETE FROM CartItems WHERE Id = @cartItemId

✔️ 3.5 Thanh toán

Nếu chưa đăng nhập → Redirect sang Login + returnUrl

Nếu đã đăng nhập → Redirect đến Checkout
