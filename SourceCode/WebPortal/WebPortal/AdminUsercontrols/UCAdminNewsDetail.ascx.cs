using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminNewsDetail : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public WebPortal.Model.TinTuc GetNewsFollowID(int id)
        {
            WebPortal.TinTuc tinTuc = new TinTuc();
            return tinTuc.Single(id);
        }
    }
}