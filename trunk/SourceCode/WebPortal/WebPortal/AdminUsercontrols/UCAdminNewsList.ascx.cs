
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminNewsList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public List<WebPortal.Model.TinTuc> GetAllNews()
        {
            WebPortal.TinTuc tinTuc = new TinTuc();
            return tinTuc.All();
        }

       
    }
}
