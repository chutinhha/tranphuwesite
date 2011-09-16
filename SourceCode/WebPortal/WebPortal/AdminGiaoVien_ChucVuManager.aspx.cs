using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminGiaoVien_ChucVu : System.Web.UI.Page
    {
        public WebPortal.GiaoVien giaovienRepository = new GiaoVien();
        public WebPortal.ChucVu chucvuRepository = new ChucVu();
        public WebPortal.ChucVu_GiaoVien cvgvRepository = new ChucVu_GiaoVien();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCVList.DataSource = chucvuRepository.All();
                ddlCVList.DataValueField = "IDCV";
                ddlCVList.DataTextField = "TenCV";
                ddlCVList.DataBind();
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