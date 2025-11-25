using System;
using System.Data;
using System.Web.UI;
using GridView = System.Web.UI.WebControls.GridView;
using Label = System.Web.UI.WebControls.Label;

namespace WebApplication1
{
    public partial class Oder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrder("Order1", GridView1, lblTotal1);
                LoadOrder("Order2", GridView2, lblTotal2);
            }
        }

        private void LoadOrder(string sessionKey, GridView grid, Label lblTotal)
        {
            DataTable tb = Session[sessionKey] as DataTable;

            if (tb == null)
            {
                grid.DataSource = null;
                grid.DataBind();
                lblTotal.Text = "Tổng tiền đơn hàng: 0 đ";
                return;
            }

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
