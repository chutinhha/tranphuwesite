using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminNewsManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool DeleteNews(int id, ref string mess)
        {
            WebPortal.TinTuc tinTuc = new TinTuc();
            if (tinTuc.Delete(id) != 0)
            {
                mess = "Đã xóa tin tức có mã: " + id;
                return true;
            }
            else
            {
                mess = "Xóa không thành công! Vui lòng thử lại.";
                return false;
            }
        }
    }
}