# Nhom7_CS434AI
## Chức năng: Thống kê báo cáo (Statistics & Reports)

## Thành viên thực hiện
**Trần Thanh Thiên** Thống kê báo cáo (doanh thu, sản phẩm bán chạy, khách hàng VIP)

## Mô tả chức năng
Chức năng **thống kê báo cáo** giúp quản trị viên theo dõi nhanh các số liệu quan trọng của hệ thống thông qua bảng dữ liệu và biểu đồ.

Chức năng bao gồm 3 phần chính:

1. **Doanh thu theo tháng**
   - Hiển thị bảng doanh thu theo từng tháng.
   - Vẽ biểu đồ cột (Column chart) thể hiện doanh thu.
   - Cho phép xuất dữ liệu doanh thu ra file Excel.

2. **Top sản phẩm bán chạy**
   - Hiển thị danh sách các sản phẩm bán chạy nhất.
   - Vẽ biểu đồ hình tròn (Pie chart) thể hiện tỉ lệ số lượng bán.
   - Cho phép xuất dữ liệu top sản phẩm ra file Excel.

3. **Khách hàng VIP**
   - Hiển thị danh sách khách hàng có mức chi tiêu cao (VIP).
   - Thể hiện tổng số đơn hàng và tổng chi tiêu.
   - Cho phép xuất danh sách khách hàng VIP ra file Excel.


## Các file đã thực hiện
- `ThongKe.aspx`  
- `ThongKe.aspx.cs`  
- `ThongKe.aspx.designer.cs`

## Thành phần giao diện chính (ThongKe.aspx)

### Doanh thu theo tháng
- `gvRevenue` – `GridView`: hiển thị dữ liệu doanh thu (năm, tháng, doanh thu).
- `chartRevenue` – `Chart` (Column): biểu đồ cột thể hiện doanh thu theo tháng.
- `btnExportRevenue` – `Button`: nút **"Xuất Excel"** để xuất báo cáo doanh thu.

###  Top sản phẩm bán chạy
- `gvTopProducts` – `GridView`: hiển thị danh sách sản phẩm bán chạy.
- `chartProducts` – `Chart` (Pie): biểu đồ tròn thể hiện tỉ lệ số lượng bán theo sản phẩm.
- `btnExportProducts` – `Button`: nút **"Xuất Excel"** để xuất báo cáo top sản phẩm.

### Khách hàng VIP
- `gvTopCustomers` – `GridView`: hiển thị danh sách khách hàng VIP (tên, số đơn hàng, tổng chi tiêu).
- `btnExportCustomers` – `Button`: nút **"Xuất Excel"** để xuất danh sách khách hàng VIP.

## Công nghệ sử dụng
- ASP.NET Web Forms (.aspx)  
- C#  
- SQL Server  
- ADO.NET  
- `System.Web.UI.DataVisualization.Charting` (Chart control)  
- HTML + CSS  

## Cách chạy dự án
1. Clone hoặc tải project về máy.  
2. Mở project bằng **Visual Studio 2017** (hoặc phiên bản mới hơn).  
3. Cấu hình chuỗi kết nối database trong file `Web.config`.  
4. Đảm bảo đã tạo và gán đúng dữ liệu cho các bảng dùng trong thống kê (hóa đơn, chi tiết hóa đơn, sản phẩm, khách hàng, v.v.).  
5. Chạy project bằng IIS Express.  
6. Mở trang `ThongKe.aspx` để xem giao diện thống kê báo cáo.

## Kết quả
- Hiển thị được **doanh thu theo tháng** dưới dạng bảng và biểu đồ.  
- Thống kê được **top sản phẩm bán chạy** kèm biểu đồ hình tròn trực quan.  
- Hiển thị danh sách **khách hàng VIP** với số đơn và tổng chi tiêu.  
- Hỗ trợ **xuất file Excel** cho từng loại thống kê.  

