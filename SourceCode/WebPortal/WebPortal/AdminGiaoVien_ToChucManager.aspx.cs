using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminGiaoVien_ToChucManager : System.Web.UI.Page
    {
        public WebPortal.ToChuc tochucRepository = new ToChuc();
        public WebPortal.GiaoVien giaovienRepository = new GiaoVien();
        public WebPortal.ToChuc_GiaoVien tcgvRepository = new ToChuc_GiaoVien();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlTCList.DataSource = tochucRepository.All();
                ddlTCList.DataValueField = "IDToChuc";
                ddlTCList.DataTextField = "TenTC";
                ddlTCList.DataBind();
            }
        }

        public bool IsInsideGiaoVienList(int gvID, List<Model.GiaoVien> list)
        {
            if (list != null)
            {
                foreach (var gv in list)
                {
                    if (gv.IDGiaoVien == gvID)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }
}