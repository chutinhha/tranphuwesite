using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminTaiNguyenCreate : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                HttpPostedFile objectFile = FileUploadControl.PostedFile;
                string pathDirectory = "/Resources/Images/Album/";
                string errorMess = "";
                string filename = Path.GetFileName(FileUploadControl.FileName);
                string formatFileName = "jpeg,jpg,gif,png";
                int maxsize = 102400;
                Libs.LibUpload.UploadFile(objectFile, pathDirectory, ref errorMess, ref filename, formatFileName, maxsize);
                if (errorMess == "Upload thành công!")
                {
                    lblThongBao.Text = errorMess;
                    ImageUpLoad.ImageUrl = "/Resources/Images/Album/" + filename;
                    PathLabel.Text = "/Resources/Images/Album/" + filename;
                }
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            WebPortal.Model.TaiNguyen taiNguyen = new Model.TaiNguyen();
            if (Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN) != null)
            {
                if (PathLabel.Text != "")
                {
                    taiNguyen.TenTaiNguyen = txtTenTN.Text;
                    taiNguyen.MoTa = txtMoTa.Text;
                    taiNguyen.Path = PathLabel.Text;
                    WebPortal.TaiNguyen tintuc = new TaiNguyen();
                    try
                    {
                        int idTaiNguyen = tintuc.Add(taiNguyen);
                        lblLuu.Text = "Lưu tài nguyên mới thành công!";
                        lblIDTN.Text = idTaiNguyen.ToString();
                    }
                    catch (Exception ex)
                    {
                        lblLuu.Text = "Quá trình lưu xảy ra lỗi: " + ex.Message;
                    }
                }
                else
                    lblThongBao.Text = "Bạn chưa có file upload!";
                Response.Write(" <Script>alert('Không xóa được')</Script>");

            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }
    }
}