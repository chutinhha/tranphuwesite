using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminLoaiTinManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool DeleteLoaiTinLv1(int idLoaiTin_Lv1, ref string mess)
        {
            WebPortal.Repository.LoaiTinLV1 loaiTin = new Repository.LoaiTinLV1();

            if (loaiTin.Delete(idLoaiTin_Lv1) != 0)
            {
                mess = "Xóa thành công loại tin có mã: " + idLoaiTin_Lv1;
                return true;
            }
            else
            {
                mess = "Quá trình xóa xảy ra lỗi! Vui lòng thử lại.";
                return false;
            }
        }

        public bool DeleteLoaiTin(int idLoaiTin,ref string messLoaiTin)
        {
            WebPortal.LoaiTin loaiTin = new LoaiTin();
            if (loaiTin.Delete(idLoaiTin) != 0)
            {
                messLoaiTin = "Xóa thành công loại tin có mã: " + idLoaiTin;
                return true;
            }
            else
            {
                messLoaiTin = "Quá trình xóa xảy ra lỗi! Vui lòng thử lại.";
                return false;
            }
        }

    }
}