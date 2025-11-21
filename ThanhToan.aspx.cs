using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DoAn
{
    public partial class Checkout : System.Web.UI.Page
    {
        private string bankId = "VCB";                 
        private string accountNo = "1054904961";       
        private string accountName = "Trần Thanh Thiên";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartItems();
            }
        }

        private void LoadCartItems()
        {
            if (Session["UserId"] != null)
            {
                int userId = (int)Session["UserId"];
                string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string query = @"
                        SELECT ci.Id AS CartItemId, p.Name AS ProductName, ci.Quantity, p.Price, 
                               (ci.Quantity * p.Price) AS TotalPrice
                        FROM CartItems ci
                        JOIN Products p ON ci.ProductId = p.Id
                        JOIN Carts c ON ci.CartId = c.Id
                        WHERE c.UserId = @userId AND c.IsCompleted = 0";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userId", userId);

                    SqlDataReader reader = cmd.ExecuteReader();
                    gvCart.DataSource = reader;
                    gvCart.DataBind();
                    UpdateTotalPrice(userId);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private void UpdateTotalPrice(int userId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query = @"
                    SELECT SUM(ci.Quantity * p.Price) 
                    FROM CartItems ci
                    JOIN Products p ON ci.ProductId = p.Id
                    JOIN Carts c ON ci.CartId = c.Id
                    WHERE c.UserId = @userId AND c.IsCompleted = 0";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@userId", userId);

                object result = cmd.ExecuteScalar();
                lblTotal.Text = result != DBNull.Value
                    ? string.Format("Tổng giá trị giỏ hàng: {0:#,##0}đ", result)
                    : "Tổng giá trị giỏ hàng: 0đ";
            }
        }
        protected void btnConfirmTransfer_Click(object sender, EventArgs e)
        {
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Cảm ơn bạn đã chuyển khoản. Vui lòng chờ admin xác nhận thanh toán!";
        }


        protected void btnConfirmOrder_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                int userId = (int)Session["UserId"];
                string name = txtName.Text.Trim();
                string address = txtAddress.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string paymentMethod = ddlPaymentMethod.SelectedValue;
                decimal totalAmount = 0;

                if (string.IsNullOrEmpty(paymentMethod))
                {
                    lblMessage.Text = "Vui lòng chọn phương thức thanh toán.";
                    return;
                }

                string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Tính tổng tiền
                    string totalQuery = @"
                        SELECT SUM(ci.Quantity * p.Price)
                        FROM CartItems ci
                        JOIN Products p ON ci.ProductId = p.Id
                        JOIN Carts c ON ci.CartId = c.Id
                        WHERE c.UserId = @userId AND c.IsCompleted = 0";
                    SqlCommand totalCmd = new SqlCommand(totalQuery, conn);
                    totalCmd.Parameters.AddWithValue("@userId", userId);
                    object result = totalCmd.ExecuteScalar();
                    totalAmount = result != DBNull.Value ? Convert.ToDecimal(result) : 0;

                    if (totalAmount == 0)
                    {
                        lblMessage.Text = "Giỏ hàng của bạn đang trống.";
                        return;
                    }

                    // Lấy CartId
                    string cartQuery = "SELECT Id FROM Carts WHERE UserId = @userId AND IsCompleted = 0";
                    SqlCommand cartCmd = new SqlCommand(cartQuery, conn);
                    cartCmd.Parameters.AddWithValue("@userId", userId);
                    object cartIdObj = cartCmd.ExecuteScalar();
                    if (cartIdObj == null)
                    {
                        lblMessage.Text = "Không tìm thấy giỏ hàng.";
                        return;
                    }
                    int cartId = Convert.ToInt32(cartIdObj);

                    // Tạo Order
                    string orderQuery = @"
                        INSERT INTO Orders (CustomerName, Phone, PaymentMethod, OrderDate, TotalAmount, PaymentStatus, UserID, Address, CartId)
                        VALUES (@name, @phone, @paymentMethod, GETDATE(), @totalAmount, 0, @UserID, @Address, @CartId);
                        SELECT SCOPE_IDENTITY();";
                    SqlCommand orderCmd = new SqlCommand(orderQuery, conn);
                    orderCmd.Parameters.AddWithValue("@name", name);
                    orderCmd.Parameters.AddWithValue("@phone", phone);
                    orderCmd.Parameters.AddWithValue("@paymentMethod", paymentMethod);
                    orderCmd.Parameters.AddWithValue("@totalAmount", totalAmount);
                    orderCmd.Parameters.AddWithValue("@UserID", userId);
                    orderCmd.Parameters.AddWithValue("@Address", address);
                    orderCmd.Parameters.AddWithValue("@CartId", cartId);

                    int orderId = Convert.ToInt32(orderCmd.ExecuteScalar());

                    // Nếu thanh toán bằng QR thì hiện mã QR động
                    if (paymentMethod == "QR")
                    {
                        pnlQR.Visible = true;
                        lblOrderId.Text = orderId.ToString();

                        // Tạo URL QR từ VietQR API
                        string qrUrl = $"https://img.vietqr.io/image/{bankId}-{accountNo}-compact2.png?amount={totalAmount}&addInfo=Order{orderId}&accountName={accountName}";
                        imgQR.ImageUrl = qrUrl;

                        return; // Giữ nguyên trang để khách quét QR
                    }

                    // Hoàn tất đơn hàng cho COD
                    string updateCartQuery = "UPDATE Carts SET IsCompleted = 1 WHERE UserId = @userId AND IsCompleted = 0";
                    SqlCommand updateCartCmd = new SqlCommand(updateCartQuery, conn);
                    updateCartCmd.Parameters.AddWithValue("@userId", userId);
                    updateCartCmd.ExecuteNonQuery();
                }

                // Redirect sang trang xác nhận cho COD
                if (paymentMethod == "COD")
                {
                    Response.Redirect("OrderConfirmation.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
