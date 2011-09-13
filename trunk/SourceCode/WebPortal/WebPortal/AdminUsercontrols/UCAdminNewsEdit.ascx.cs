using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminNewsEdit : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "edit" && !IsPostBack)
            {
                LoadChiTietTin();
               
            }
        }

        public WebPortal.Model.TinTuc GetNews(int id)
        {
            WebPortal.TinTuc tinTuc = new TinTuc();
            return tinTuc.Single(id);
        }

        public WebPortal.Model.LoaiTin GetLoaiTin(int idLoaiTin)
        {
            WebPortal.LoaiTin loaiTin = new LoaiTin();
            return loaiTin.Single(idLoaiTin);
        }

        public void LoadChiTietTin()
        {
            int idTinTuc = Convert.ToInt32(Request.QueryString["id"]);
            WebPortal.Model.TinTuc tinTuc = GetNews(idTinTuc);
            WebPortal.Model.LoaiTin loaiTin = GetLoaiTin(tinTuc.IDLoaiTin);
            WebPortal.LoaiTin lt = new LoaiTin();
            List<string> list = new List<string>();
            foreach (WebPortal.Model.LoaiTin l in lt.All())
            {
                list.Add(l.TenLoai);
            }
            dropDownListLoaiTin.DataSource = list;

            for (int i = 0; i < list.Count; i++)
            {
                if (list[i] == loaiTin.TenLoai)
                {
                    dropDownListLoaiTin.SelectedIndex = i;
                }
            }

            dropDownListLoaiTin.DataBind();
            titleNews.Text = tinTuc.TenTinTuc;
            ImageUpLoad.ImageUrl = "~/" + tinTuc.HinhAnh;
            summary.Text = tinTuc.MoTaTinTuc;
        }

        public string LoadNoiDungTin()
        {
            int idTinTuc = Convert.ToInt32(Request.QueryString["id"]);
            WebPortal.Model.TinTuc tinTuc = GetNews(idTinTuc);
            return tinTuc.NoiDung;
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                HttpPostedFile objectFile = FileUploadControl.PostedFile;
                string pathDirectory = "~/Resources/Images/";
                string errorMess = "";
                string filename = Path.GetFileName(FileUploadControl.FileName);
                string formatFileName = "jpeg,jpg,gif";
                int maxsize = 102400;
                Libs.LibUpload.UploadFile(objectFile, pathDirectory, ref errorMess, ref filename, formatFileName, maxsize);
                StatusLabel.Text = "Upload status: " + errorMess;
                if (errorMess == "Upload thành công!")
                {
                    ImageUpLoad.ImageUrl = "~/Resources/Images/" + filename;
                    PathLabel.Text = "Resources/Images/" + filename;
                }
            }
        }
        private int GetIDLoaiTinFollowTenLoai(string tenLoai)
        {
            List<WebPortal.Model.LoaiTin> list = new List<Model.LoaiTin>();
            WebPortal.LoaiTin loai = new LoaiTin();
            list = loai.All();
            foreach (WebPortal.Model.LoaiTin l in list)
            {
                if (l.TenLoai == tenLoai)
                    return l.IDLoaiTin;
            }
            return -1;
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            string tenLoai = dropDownListLoaiTin.SelectedValue.ToString();
            int idLoai = GetIDLoaiTinFollowTenLoai(tenLoai);
            string nguoiDang = "admin";
            DateTime date = DateTime.Now;
            WebPortal.Model.TinTuc news = new Model.TinTuc();
            news.IDLoaiTin = idLoai;
            news.MoTaTinTuc = summary.Text;
            news.NgayDang = date;
            news.NguoiDang = nguoiDang;
            news.NoiDung = Request.Form["elm1"].ToString();
            news.TenTinTuc = titleNews.Text;
            news.HinhAnh = PathLabel.Text;
            news.IDTinTuc = Convert.ToInt32(Request.QueryString["id"]);
            WebPortal.TinTuc tintuc = new TinTuc();
            try
            {
                tintuc.Update(news);
                SaveNews.Text = "Lưu thay đổi thành công";
                IDTinTuc.Text = Request.QueryString["id"];
            }
            catch (Exception ex)
            {
                SaveNews.Text = "Quá trình lưu xảy ra lỗi: " + ex.Message;
            }

        }

        protected void AttachFiles_Click(object sender, EventArgs e)
        {
            string urlCurrent = Request.Url.ToString();
            string str = urlCurrent.Substring(0, urlCurrent.IndexOf("&"));
            str += "&type=attach&idNews=";
            str += Request.QueryString["id"];
            Response.Redirect(str);
        }
    }
}