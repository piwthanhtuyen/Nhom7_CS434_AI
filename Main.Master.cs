using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lnkAccount.Text = "👤 Thông tin cá nhân";
                lnkAccount.NavigateUrl = "~/Profile.aspx"; 

                lnkLogout.Visible = true;
            }
            else
            {
                lnkAccount.Text = "👤 Đăng Nhập";
                lnkAccount.NavigateUrl = "~/Login.aspx"; 

                lnkLogout.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text;

            Response.Redirect($"Search.aspx?q={searchQuery}");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("TrangChu.aspx");
        }
    }
}