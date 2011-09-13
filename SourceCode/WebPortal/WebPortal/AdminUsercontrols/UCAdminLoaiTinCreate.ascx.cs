using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminLoaiTinCreate : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string tenLoaiTin = Name.Text;
            string moTa = Summary.Text;
            if (tenLoaiTin == "")
            {
                SaveChange.Text = "Tên Loại Tin Mức 1 không được để trống!Bạn vui lòng nhập đầy đủ.";
            }
            else
            {
                WebPortal.Model.LoaiTin_Lv1 loaiTin = new Model.LoaiTin_Lv1();
                loaiTin.TenLoai = tenLoaiTin;
                loaiTin.MoTa = moTa;
                WebPortal.Repository.LoaiTinLV1 lt = new Repository.LoaiTinLV1();
                try
                {
                    lt.Add(loaiTin);
                    SaveChange.Text = "Save change successful!";
                }
                catch (Exception ex)
                {
                    SaveChange.Text = ex.Message;
                }
            }
        }

        protected void CreatChild_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLoaiTinManager.aspx?id=-1&type=createChild");
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLoaiTinManager.aspx");

        }

        protected void Back1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLoaiTinManager.aspx?id=-1&type=listChild");
        }
    }
}