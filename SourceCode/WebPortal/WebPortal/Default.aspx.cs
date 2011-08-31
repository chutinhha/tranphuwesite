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
            WebPortal.ChucVu app = new ChucVu();
            WebPortal.Model.ChucVu cv = new Model.ChucVu();
            cv.TenCV = "HieuTruong";
            cv.MoTa = "Sap nghi huu";
           
                Response.Write(app.Add(cv));
           
        }
    }
}
