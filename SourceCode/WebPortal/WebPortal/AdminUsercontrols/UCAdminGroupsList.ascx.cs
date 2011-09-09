using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPortal.Model;
using WebPortal.Repository;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminGroupsList : System.Web.UI.UserControl
    {

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminGroupsManager.aspx?id=0&type=new");
        }
    }
}