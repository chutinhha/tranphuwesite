using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminApplicationPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ThemApplication_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AdminApplicationManager.aspx?id=0&type=new");
        }

        protected void QuanLyApplication_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AdminApplicationManager.aspx");
        }
    }
}