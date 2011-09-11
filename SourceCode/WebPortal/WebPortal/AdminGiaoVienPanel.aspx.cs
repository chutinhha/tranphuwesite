using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminGiaoVienPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ThemGiaoVien_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AdminGiaoVienManager.aspx?id=0&type=new");
        }

        protected void QuanLyApplication_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AdminGiaoVienManager.aspx");
        }
    }
}