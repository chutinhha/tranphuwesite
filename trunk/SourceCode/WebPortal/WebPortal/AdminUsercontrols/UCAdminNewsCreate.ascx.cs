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
            if (FileUploadControl.HasFile)
            {
                HttpPostedFile objectFile = FileUploadControl.PostedFile;
                string pathDirectory = "~/ImageNews/";
                string errorMess = "";
                string filename = Path.GetFileName(FileUploadControl.FileName);
                string formatFileName = "jpeg,jpg,gif";
                int maxsize = 102400;
                Libs.LibUpload.UploadFile(objectFile, pathDirectory, ref errorMess, ref filename, formatFileName, maxsize);
                StatusLabel.Text = "Upload status: "+ errorMess;
                if (errorMess == "Upload thành công!")
                {
                    ImageUpLoad.ImageUrl = "~/ImageNews/" + filename;
                    PathLabel.Text = "ImageNews/" + filename;
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
            WebPortal.TinTuc tintuc = new TinTuc();
            try
            {
                int idNews = tintuc.Add(news);
                SaveNews.Text = "Save News Success!";
                IDTinTuc.Text = idNews.ToString();
            }
            catch (Exception ex)
            {
                SaveNews.Text = "Save News Falled! The following error occured: " + ex.Message;
            }


        }

        protected void AttachFiles_Click(object sender, EventArgs e)
        {
            if (SaveNews.Text == "Save News Success!")
            {
                string urlCurrent = Request.Url.ToString();
                urlCurrent += "&idNews=";
                urlCurrent += IDTinTuc.Text;
                Response.Redirect(urlCurrent);
            }
            else
            {
                SaveNews.Text = "You can't attach files. You need create and save a news!"; 
            }
        }

    }
}