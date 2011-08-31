using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WebPortal.Application app = new Application();
            foreach (var item in app.All())
            {
                Response.Write(item.Application_Name);
            }
        }
    }
}
