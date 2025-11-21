using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using GridView = System.Web.UI.WebControls.GridView;
using Label = System.Web.UI.WebControls.Label;
namespace WebApplication1
{
    public partial class Oder : System.Web.UI.Page
    {
        private string connStr = @"Data Source=.;Initial Catalog=BookStore;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrder(1, GridView1, lblTotal1);
                LoadOrder(2, GridView2, lblTotal2);
            }
        }

        private void LoadOrder(int orderId, GridView grid, Label lblTotal)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string sql = @"
            SELECT SanPham, SoLuong, DonGia, (SoLuong * DonGia) AS ThanhTien
            FROM ChiTietDonHang 
            WHERE MaDonHang = @id";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@id", orderId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable tb = new DataTable();
                da.Fill(tb);

                grid.DataSource = tb;
                grid.DataBind();
                int tong = 0;
                foreach (DataRow r in tb.Rows)
                {
                    tong += Convert.ToInt32(r["ThanhTien"]);
                }

                lblTotal.Text = "Tổng tiền đơn hàng: " + tong.ToString("N0") + " đ";
            }
        }

    }
}
}
