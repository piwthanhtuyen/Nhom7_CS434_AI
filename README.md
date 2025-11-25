# Nhom7_CS417C
## Chức năng: Tìm kiếm sản phẩm (Search Feature)

## Thành viên thực hiện
**Đào Võ Thanh Tuyền** – Tìm kiếm sản phẩm (Search functionality)

## Mô tả chức năng
Chức năng **tìm kiếm sản phẩm** cho phép người dùng nhập từ khóa để tìm các sản phẩm có tên trùng khớp trong cơ sở dữ liệu.

Chức năng bao gồm:
- Ô tìm kiếm (search bar) trên trang Master
- Gửi từ khóa qua QueryString
- Lấy dữ liệu từ database theo LIKE '%keyword%'
- Hiển thị kết quả dưới dạng grid
- Phân trang (paging: next/prev)
- Thông báo nếu không tìm thấy sản phẩm

## Các file đã thực hiện
- `Main.Master.aspx`  
- `Main.Master.aspx.cs`  
- `Main.Master.aspx.designer.cs`
- `Search.aspx`
- `Search.aspx.cs`
- `Search.aspx.designer.cs`

## Công nghệ sử dụng
- ASP.NET Web Forms (.aspx)
- C#
- SQL Server
- ADO.NET
- HTML + CSS

## Cách chạy dự án
1. Clone hoặc tải project về máy  
2. Mở bằng **Visual Studio 2017 hoặc mới hơn**  
3. Cấu hình chuỗi kết nối trong `Web.config`  
4. Chạy database SQL Server  
5. Bấm **Start (IIS Express)** để chạy web  

## Kết quả
- Gõ từ khóa → hiện danh sách sản phẩm phù hợp  
- Có hỗ trợ phân trang  
- Xử lý tình huống "Không tìm thấy sản phẩm"

## Ghi chú
Đây là phần chức năng thuộc nhóm, mỗi thành viên làm nhánh riêng.  
Branch của tôi: **DaoVoThanhTuyen_TimKiem**
