using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminLoaiTinCreateChild : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "createChild" && !IsPostBack)
            {
                LoadListLoaiTin();
            }

        }

        public List<string> GetListLoaiTin1()
        {
            List<string> list = new List<string>();
            WebPortal.LoaiTin_Lv1 loaiTin = new LoaiTin_Lv1();
            foreach (WebPortal.Model.LoaiTin_Lv1 lt in loaiTin.All())
            {
                list.Add(lt.TenLoai);
            }

            return list;
        }

        public void LoadListLoaiTin()
        {
            List<string> list = new List<string>();
            WebPortal.LoaiTin_Lv1 loaiTin = new LoaiTin_Lv1();
            foreach (WebPortal.Model.LoaiTin_Lv1 lt in loaiTin.All())
            {
                list.Add(lt.TenLoai);
            }

            ListLoaiTin.DataSource = list;
            ListLoaiTin.DataBind();
        }

        public int GetIDLoaiTin1FollowName(string tenLoaiTin1)
        {
            WebPortal.LoaiTin_Lv1 loaiTin1 = new LoaiTin_Lv1();
            foreach (WebPortal.Model.LoaiTin_Lv1 lt in loaiTin1.All())
            {
                if (lt.TenLoai == tenLoaiTin1)
                    return lt.IDLoaiTin_Lv1;
            }

            return -1;
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            string strLoaiTin1 = ListLoaiTin.SelectedValue;
            string tenLoaiTin = Name.Text;
            string moTa = Summary.Text;
            if (tenLoaiTin == "")
            {
                SaveChange.Text = "Error while save!'Tên Loại Tin Mức 2' not null";
            }
            else
            {
                WebPortal.Model.LoaiTin loaiTin = new Model.LoaiTin();
                loaiTin.TenLoai = tenLoaiTin;
                loaiTin.MoTa = moTa;
                WebPortal.LoaiTin lt = new LoaiTin();
                loaiTin.LoaiTin_Lv1ID = GetIDLoaiTin1FollowName(strLoaiTin1);
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