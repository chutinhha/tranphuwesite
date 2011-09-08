using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminPermissionPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ThemPermission_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AdminPermissionManager.aspx?id=0&type=new");
        }

        protected void QuanLyPermission_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AdminPermissionManager.aspx");
        }
    }
}