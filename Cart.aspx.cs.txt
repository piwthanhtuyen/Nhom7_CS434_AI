using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace DoAn
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AssignCartToUser();
                LoadCartItems();
            }
        }

        private void LoadCartItems()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                int cartId = 0;

                if (Session["CartId"] == null)
                {
                    string createCartQuery = "INSERT INTO Carts (IsCompleted) OUTPUT INSERTED.Id VALUES (0)";
                    SqlCommand createCartCmd = new SqlCommand(createCartQuery, conn);
                    cartId = (int)createCartCmd.ExecuteScalar();

                    Session["CartId"] = cartId;
                }
                else
                {
                    cartId = (int)Session["CartId"];
                }

                string query = @"
                    SELECT ci.Id AS CartItemId, p.Name AS ProductName, ci.Quantity, p.Price, 
                           (ci.Quantity * p.Price) AS TotalPrice
                    FROM CartItems ci
                    JOIN Products p ON ci.ProductId = p.Id
                    WHERE ci.CartId = @cartId";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cartId", cartId);

                SqlDataReader reader = cmd.ExecuteReader();
                gvCart.DataSource = reader;
                gvCart.DataBind();

                UpdateTotalPrice(cartId);
            }
        }

        private void UpdateTotalPrice(int cartId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query = @"
                    SELECT SUM(ci.Quantity * p.Price) 
                    FROM CartItems ci
                    JOIN Products p ON ci.ProductId = p.Id
                    WHERE ci.CartId = @cartId";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cartId", cartId);

                object result = cmd.ExecuteScalar();
                lblTotal.Text = result != DBNull.Value ? string.Format("{0:#,##0}đ", result) : "0đ";
            }
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvCart.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    try
                    {
                        int cartItemId = Convert.ToInt32(gvCart.DataKeys[row.RowIndex].Value);
                        TextBox txtQuantity = (TextBox)row.FindControl("txtQuantity");

                        if (txtQuantity != null && int.TryParse(txtQuantity.Text, out int quantity) && quantity > 0)
                        {
                            string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;

                            using (SqlConnection conn = new SqlConnection(connStr))
                            {
                                conn.Open();

                                string query = "UPDATE CartItems SET Quantity = @quantity WHERE Id = @cartItemId";
                                SqlCommand cmd = new SqlCommand(query, conn);
                                cmd.Parameters.AddWithValue("@quantity", quantity);
                                cmd.Parameters.AddWithValue("@cartItemId", cartItemId);
                                cmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Số lượng không hợp lệ!');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Có lỗi xảy ra khi cập nhật giỏ hàng!');</script>");
                    }
                }
            }

            LoadCartItems();
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int cartItemId = Convert.ToInt32(e.CommandArgument);

                string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string query = "DELETE FROM CartItems WHERE Id = @cartItemId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@cartItemId", cartItemId);
                    cmd.ExecuteNonQuery();
                }

                LoadCartItems();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=Checkout.aspx");
            }
            else
            {
                Response.Redirect("Checkout.aspx");
            }
        }

        private void AssignCartToUser()
        {
            if (Session["CartId"] != null && Session["UserId"] != null)
            {
                int cartId = (int)Session["CartId"];
                int userId = (int)Session["UserId"];
                string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // Chỉ gán nếu cart chưa có UserId
                    string query = "UPDATE Carts SET UserId = @userId WHERE Id = @cartId AND UserId IS NULL";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@cartId", cartId);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
