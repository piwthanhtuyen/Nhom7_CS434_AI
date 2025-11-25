# Nhom7_CS434AI
# Đề Tài: Quản Lý Bán Sách
## Chức năng và thành viên thực hiện
1. Chức năng Tìm kiếm sản phẩm - Đào Võ Thanh Tuyền 
- Chức năng tìm kiếm sản phẩm cho phép người dùng nhập từ khóa để tìm các sản phẩm có tên trùng khớp trong cơ sở dữ liệu.
- Chức năng bao gồm: Ô tìm kiếm (search bar) trên trang Master, gửi từ khóa qua QueryString, lấy dữ liệu từ database, hiển thị kết quả dưới dạng grid, phân trang (paging: next/prev), thông báo nếu không tìm thấy sản phẩm
2. Chức năng Thanh Toán - Thùy Ngọc Khoa
- Giới thiệu dự án Website Bán Sách Online cho phép người dùng xem sách, thêm vào giỏ hàng và thực hiện thanh toán bằng QR Code hoặc Thanh toán khi nhận hàng (COD). Chức năng thanh toán là một trong những phần quan trọng nhất của hệ thống, đảm bảo trải nghiệm người dùng mượt mà và chính xác.
3. Chức năng Xem chi tiết đơn hàng - Nguyễn Văn Quân
- Tại trang này, người dùng có thể xem mã đơn hàng cùng với toàn bộ sản phẩm đi kèm, bao gồm tên sản phẩm, số lượng, đơn giá và số tiền phải thanh toán cho từng mặt hàng. Nhờ đó, khách hàng dễ dàng kiểm tra lại lịch sử mua sắm của mình, đảm bảo tính minh bạch và thuận tiện trong quá trình tra cứu thông tin đơn hàng.
4. Giới thiệu chức năng Giỏ hàng - Lê Minh
- Chức năng Giỏ hàng cho phép người dùng lưu trữ và quản lý các sản phẩm đã chọn trước khi tiến hành thanh toán. Đây là một bước quan trọng trong quy trình mua sắm, giúp người dùng dễ dàng xem lại sản phẩm, điều chỉnh số lượng, xóa bớt hoặc tiếp tục quá trình mua hàng. Giỏ hàng hoạt động như một không gian tạm thời, đảm bảo các lựa chọn của khách hàng được lưu lại trong suốt quá trình duyệt web, đồng thời hỗ trợ tính toán tự động tổng giá trị đơn hàng. Chức năng này góp phần nâng cao trải nghiệm người dùng và tối ưu hóa quy trình đặt hàng trên hệ thống.
5. Chức năng thêm vào giỏ hàng cho phép người dùng lưu sản phẩm muốn mua vào giỏ hàng - Đoàn Văn Vinh
- Khi nhấn nút “Thêm vào giỏ hàng”, hệ thống sẽ tạo giỏ mới nếu chưa tồn tại, hoặc cập nhật số lượng nếu sản phẩm đã có sẵn. Dữ liệu được lưu vào database và Session, đồng thời thông báo cho người dùng khi thao tác thành công.
6. Chức năng xem chi tiết sản phẩm - Lê Văn Ngọc 
- Chức năng Xem chi tiết sản phẩm cho phép người dùng lựa chọn một sản phẩm từ danh sách và xem đầy đủ thông tin liên quan đến sản phẩm đó. Giao diện được thiết kế rõ ràng, trực quan, giúp người dùng dễ dàng nắm bắt thông tin.
7. Trần Thanh Thiên - Thống kê báo cáo (doanh thu, sản phẩm bán chạy, khách hàng VIP)
#### Mô tả chức năng thống kê
- Chức năng **thống kê báo cáo** giúp quản trị viên theo dõi nhanh các số liệu quan trọng của hệ thống thông qua bảng dữ liệu và biểu đồ.
- Chức năng bao gồm 3 phần chính:
##### Doanh thu theo tháng
- Hiển thị bảng doanh thu theo từng tháng.
- Vẽ biểu đồ cột (Column chart) thể hiện doanh thu.
- Cho phép xuất dữ liệu doanh thu ra file Excel.
##### Top sản phẩm bán chạy
- Hiển thị danh sách các sản phẩm bán chạy nhất.
- Vẽ biểu đồ hình tròn (Pie chart) thể hiện tỉ lệ số lượng bán.
- Cho phép xuất dữ liệu top sản phẩm ra file Excel.
##### Khách hàng VIP
- Hiển thị danh sách khách hàng có mức chi tiêu cao (VIP).
- Thể hiện tổng số đơn hàng và tổng chi tiêu.
- Cho phép xuất danh sách khách hàng VIP ra file Excel.
## Công nghệ sử dụng
- ASP.NET Web Forms (.aspx)
- C#
- SQL Server
- ADO.NET
- JavaScript (Inline Alert)
- HTML + CSS
