using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminNewsCreate : System.Web.UI.UserControl
    {
        public string pathImage = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                List<WebPortal.Model.LoaiTin> list = new List<Model.LoaiTin>();
                WebPortal.LoaiTin loai = new LoaiTin();
                list = loai.All();
                List<string> listLoai = new List<string>();
                for (int i = 0; i < list.Count; i++)
                {
                    listLoai.Add(list[i].TenLoai);
                }

                dropDownListLoaiTin.DataSource = listLoai;
                dropDownListLoaiTin.DataBind();
            }

        }
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (StatusLabel.Text == "Upload thành công!")
            {
                string fileName = PathLabel.Text;
                Libs.LibFile.DeleteFile(Server.MapPath(fileName));
            }
            if (FileUploadControl.HasFile)
            {
                HttpPostedFile objectFile = FileUploadControl.PostedFile;
                string pathDirectory = "~/Resources/Images/";
                string errorMess = "";
                string filename = string.Empty;
                string formatFileName = "jpeg,jpg,gif,png";
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

        public string GetContent()
        {
            return Request.Form["elm1"].ToString();
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
        //protected void Save_Click(object sender, EventArgs e)
        //{
        //    string tenLoai = dropDownListLoaiTin.SelectedValue.ToString();
        //    int idLoai = GetIDLoaiTinFollowTenLoai(tenLoai);
        //    WebPortal.Model.TinTuc news = new Model.TinTuc();
        //    if (Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN) != null)
        //    {
        //        string nguoiDang = Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN).ToString();
        //        DateTime date = DateTime.Now;

        //        news.IDLoaiTin = idLoai;
        //        news.MoTaTinTuc = summary.Text;
        //        news.NgayDang = date;
        //        news.NguoiDang = nguoiDang;
        //        news.NoiDung = Request.Form["elm1"].ToString();
        //        news.TenTinTuc = titleNews.Text;
        //        news.HinhAnh = PathLabel.Text;
        //        WebPortal.TinTuc tintuc = new TinTuc();
        //        try
        //        {
        //            int idNews = tintuc.Add(news);
        //            SaveStatus.Text = "Lưu tin tức mới thành công!";
        //            IDTinTuc.Text = idNews.ToString();
        //            titleNews.Text = "";
        //            summary.Text = "";
        //            StatusLabel.Text = "";
        //        }
        //        catch (Exception ex)
        //        {
        //            SaveStatus.Text = "Quá trình lưu xảy ra lỗi! Vui lòng thử lại.";
        //        }
        //    }
        //    else
        //    {
        //        Response.Redirect("AdminLogin.aspx");
        //    }
            
        //}

        public bool SaveNews(ref int id)
        {
            string tenLoai = dropDownListLoaiTin.SelectedValue.ToString();
            int idLoai = GetIDLoaiTinFollowTenLoai(tenLoai);
            WebPortal.Model.TinTuc news = new Model.TinTuc();
            if (Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN) != null)
            {
                string nguoiDang = Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN).ToString();
                DateTime date = DateTime.Now;

                news.IDLoaiTin = idLoai;
                news.MoTaTinTuc = summary.Text;
                news.NgayDang = date;
                news.NguoiDang = nguoiDang;
                news.NoiDung = Request.Form["elm1"].ToString();
                news.TenTinTuc = titleNews.Text;
                news.HinhAnh = PathLabel.Text;
                WebPortal.TinTuc tintuc = new TinTuc();
                try
                {
                    id = tintuc.Add(news);
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
                return false;
            }
            
        }
        //protected void AttachFiles_Click(object sender, EventArgs e)
        //{
        //    if (SaveStatus.Text == "Lưu tin tức mới thành công!")
        //    {
        //        string urlCurrent = Request.Url.ToString();
        //        string str = urlCurrent.Substring(0, urlCurrent.IndexOf("&"));
        //        str += "&type=attach&idNews=";
        //        str += IDTinTuc.Text;
        //        Response.Redirect(str);
        //    }
        //    else
        //    {
        //        SaveStatus.Text = "Bạn không thể đính kèm files, trước khi bạn lưu tin tức này!";
        //    }
        //}

        //public void RedirectAttachFile()
        //{
        //    string urlCurrent = Request.Url.ToString();
        //    string str = urlCurrent.Substring(0, urlCurrent.IndexOf("&"));
        //    str += "&type=attach&idNews=";
        //    str += IDNews.Text;
        //    Response.Redirect(str);
        //}
    }
}