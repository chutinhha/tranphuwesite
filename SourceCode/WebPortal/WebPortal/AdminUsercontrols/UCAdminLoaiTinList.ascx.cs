using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminLoaiTinList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }
        public List<WebPortal.Model.LoaiTin_Lv1> GetAllLoaiTin()
        {
            WebPortal.Repository.LoaiTinLV1 loaiTin = new Repository.LoaiTinLV1();
            return loaiTin.All();
        }

    }
}