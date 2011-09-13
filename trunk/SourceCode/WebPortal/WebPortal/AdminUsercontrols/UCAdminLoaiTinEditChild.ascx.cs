using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminLoaiTinEditChild : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "editChild" && !IsPostBack)
            {
                int idLoaiTin = Convert.ToInt32(Request.QueryString["id"]);
                LoadThongTinLoaiTin(idLoaiTin);
                LoadListLoaiTin();
            }
        }


        public void LoadListLoaiTin()
        {
            List<string> list = new List<string>();
            WebPortal.Repository.LoaiTinLV1 loaiTin = new Repository.LoaiTinLV1();
            foreach (WebPortal.Model.LoaiTin_Lv1 lt in loaiTin.All())
            {
                list.Add(lt.TenLoai);
            }

            ListLoaiTin.DataSource = list;
            ListLoaiTin.DataBind();
        }

        public int GetIDLoaiTin1FollowName(string tenLoaiTin1)
        {
            WebPortal.Repository.LoaiTinLV1 loaiTin1 = new Repository.LoaiTinLV1();
            foreach (WebPortal.Model.LoaiTin_Lv1 lt in loaiTin1.All())
            {
                if (lt.TenLoai == tenLoaiTin1)
                    return lt.IDLoaiTin_Lv1;
            }

            return -1;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int idLoaiTin = Convert.ToInt32(Request.QueryString["id"]);
            WebPortal.LoaiTin lt = new LoaiTin();
            int idLoaiTin_Lv1 = GetIDLoaiTin1FollowName(ListLoaiTin.SelectedValue);
            WebPortal.Model.LoaiTin loaiTin = lt.Single(idLoaiTin);
            if (Name.Text == "")
            {
                SaveChange.Text = "Tên Loại Tin Mức 2 không được để trống!";
            }
            else
            {
                loaiTin.LoaiTin_Lv1ID = idLoaiTin_Lv1;
                loaiTin.MoTa = Summary.Text;
                loaiTin.TenLoai = Name.Text;
                try
                {

                    lt.Update(loaiTin);
                    SaveChange.Text = "Cập nhật thành công";
                }
                catch (Exception ex)
                {
                    SaveChange.Text = ex.Message;
                }
            }
        }

        public void LoadThongTinLoaiTin(int idLoaiTin)
        {
            WebPortal.LoaiTin lt = new LoaiTin();
            WebPortal.Model.LoaiTin loaiTin = lt.Single(idLoaiTin);
            Name.Text = loaiTin.TenLoai;
            Summary.Text = loaiTin.MoTa;
        }

       
        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLoaiTinManager.aspx?id=-1&type=listChild");
        }


        protected void Back1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLoaiTinManager.aspx");
        }
    }
}