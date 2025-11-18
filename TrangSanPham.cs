using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn
{
    public partial class TrangSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int productId = 0;
                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out productId))
                {
                    LoadProductDetails(productId);
                }
                else
                {
                    Response.Redirect("TrangChu.aspx");
                }
            }
        }

        private void LoadProductDetails(int productId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT Id, Name, ImageUrl, Description, Price FROM Products WHERE Id = @productId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@productId", productId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblName.Text = reader["Name"].ToString();
                        lblDescription.Text = reader["Description"].ToString();
                        lblPrice.Text = string.Format("{0:#,##0}đ", reader["Price"]);
                        imgProduct.ImageUrl = reader["ImageUrl"].ToString();
                    }
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int productId = int.Parse(Request.QueryString["id"]);
            string connStr = ConfigurationManager.ConnectionStrings["PhoneStoreConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                int cartId = 0;

                if (Session["CartId"] != null)
                {
                    cartId = (int)Session["CartId"];
                }
                else
                {
 
                    string createCartQuery = "INSERT INTO Carts (UserId, IsCompleted) OUTPUT INSERTED.Id VALUES (NULL, 0)";
                    SqlCommand createCartCmd = new SqlCommand(createCartQuery, conn);
                    cartId = (int)createCartCmd.ExecuteScalar();

                    Session["CartId"] = cartId;
                }

                string checkItemQuery = "SELECT COUNT(*) FROM CartItems WHERE CartId = @cartId AND ProductId = @productId";
                SqlCommand checkItemCmd = new SqlCommand(checkItemQuery, conn);
                checkItemCmd.Parameters.AddWithValue("@cartId", cartId);
                checkItemCmd.Parameters.AddWithValue("@productId", productId);

                int itemCount = (int)checkItemCmd.ExecuteScalar();
                if (itemCount == 0)
                {
                    string addItemQuery = "INSERT INTO CartItems (CartId, ProductId, Quantity) VALUES (@cartId, @productId, 1)";
                    SqlCommand addItemCmd = new SqlCommand(addItemQuery, conn);
                    addItemCmd.Parameters.AddWithValue("@cartId", cartId);
                    addItemCmd.Parameters.AddWithValue("@productId", productId);
                    addItemCmd.ExecuteNonQuery();
                }
                else
                {
                    string updateQuantityQuery = "UPDATE CartItems SET Quantity = Quantity + 1 WHERE CartId = @cartId AND ProductId = @productId";
                    SqlCommand updateQuantityCmd = new SqlCommand(updateQuantityQuery, conn);
                    updateQuantityCmd.Parameters.AddWithValue("@cartId", cartId);
                    updateQuantityCmd.Parameters.AddWithValue("@productId", productId);
                    updateQuantityCmd.ExecuteNonQuery();
                }

                string countQuery = "SELECT SUM(Quantity) FROM CartItems WHERE CartId = @cartId";
                SqlCommand countCmd = new SqlCommand(countQuery, conn);
                countCmd.Parameters.AddWithValue("@cartId", cartId);

                object totalQuantity = countCmd.ExecuteScalar();
                Session["CartItemCount"] = totalQuantity ?? 0;

                Response.Write("<script>alert('Sản phẩm đã được thêm vào giỏ hàng');</script>");
            }
        }
    }
}
