using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminGroupsPanel : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ThemNhom_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(@"AdminGroupsManager.aspx?id=0&type=new");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AdminGroupsManager.aspx");
        }
    }
}