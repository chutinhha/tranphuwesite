using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class News : System.Web.UI.Page
    {
        public string idtin;
        protected void Page_Load(object sender, EventArgs e)
        {
         
            //if (idtin != null)
            //{ 
                
            //}
        }
        public List<Model.TaiNguyen_TinTuc> LayTaiNguyen_TinTuc(int idTinTuc)
        {
            WebPortal.TaiNguyen_TinTuc tt = new TaiNguyen_TinTuc();
            return tt.LayTaiNguyenTheoTin(idTinTuc);
        }
        public Model.TaiNguyen LayTaiNguyenTheoID(int id)
        {
            WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
            return taiNguyen.Single(id);
        }
    }
}