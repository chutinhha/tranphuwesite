using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminUserProfile : System.Web.UI.UserControl
    {
        public WebPortal.Repository.Profile profileRepository = new Repository.Profile();
        public WebPortal.Repository.User userRepository = new Repository.User();
        protected HtmlInputFile inputFile;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool UpdateProfile(ref string notificatedMessage)
        {
            int id = Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0);
            var profile = profileRepository.Single(Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0));
            var user = userRepository.Single(profile.UserID);

            if (!string.IsNullOrWhiteSpace(Request.Form["firstname"].ToString()))
            {
                profile.FirstName = Request.Form["firstname"].ToString();
            }

            if (!string.IsNullOrWhiteSpace(Request.Form["lastname"].ToString()))
            {
                profile.LastName = Request.Form["lastname"].ToString();
            }

            profile.Position = Request.Form["position"].ToString();

            if (Request.Files[0] != null)
            {
                //Xóa file hình cũ
                if (profile.Image != null)
                {
                    string oldFileName = Server.MapPath(profile.Image);
                    if (File.Exists(oldFileName))
                    {
                        Libs.LibFile.DeleteFile(oldFileName);
                    }
                }

                //Upload hình mới
                HttpPostedFile file = Request.Files[0];
                string fileName = string.Empty;
                string path = "~/Resources/Images/";
                if (!Libs.LibUpload.UploadFile(file, path, ref notificatedMessage, ref fileName, "jpg,jpeg,png,gif", 30000))
                {
                    return false;
                }
                profile.Image = "/Resources/Images/" + fileName;
            }

            profile.Address = Request.Form["address"].ToString();
            profile.Phone = Request.Form["phone"].ToString();

            if (Request.Form["genre"].ToString() == "male")
            {
                profile.Genre = "Nam";
            }
            else
            {
                profile.Genre = "Nữ";
            }

            profile.Ethnic = Request.Form["ethnic"].ToString();
            profile.Religion = Request.Form["religion"].ToString();
            profile.Birdthday = Libs.LibConvert.ConvertToDateTime(Request.Form["birthday"].ToString(), DateTime.Now);

            if (Request.Form["active"].ToString() == "on")
            {
                profile.Active = true;
            }
            else
            {
                profile.Active = false;
            }

            profile.LastUpdateProfile = DateTime.Now;

            if (profileRepository.Update(profile) != 0)
            {
                notificatedMessage = "Cập nhật profile thành công";
                return true;
            }
            else
            {
                notificatedMessage = "Cập nhật profile không thành công";
                return false;
            }
        }

        public bool InsertProfile(int userID, ref string notificatedMessage)
        {
            int id = Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0);
            WebPortal.Model.Profile profile = new Model.Profile();
            profile.UserID = userID;
            if (!string.IsNullOrWhiteSpace(Request.Form["firstname"].ToString()))
            {
                profile.FirstName = Request.Form["firstname"].ToString();
            }

            if (!string.IsNullOrWhiteSpace(Request.Form["lastname"].ToString()))
            {
                profile.LastName = Request.Form["lastname"].ToString();
            }
            profile.Position = Request.Form["position"].ToString();

            if (Request.Files[0] != null)
            {
                HttpPostedFile file = Request.Files[0];
                string fileName = string.Empty;
                string path = "~/Resources/Images/";
                if (!Libs.LibUpload.UploadFile(file, path, ref notificatedMessage, ref fileName, "jpg,jpeg,png,gif", 50000))
                {
                    return false;
                }
                profile.Image = "/Resources/Images/" + fileName;
            }

            profile.Address = Request.Form["address"].ToString();
            profile.Phone = Request.Form["phone"].ToString();
            profile.Birdthday = Libs.LibConvert.ConvertToDateTime(Request.Form["birthday"].ToString(), DateTime.Now);
            if (!string.IsNullOrWhiteSpace(Request.Form["genre"]))
            {
                if (Request.Form["genre"].ToString() == "male")
                {
                    profile.Genre = "Nam";
                }
                else
                {
                    profile.Genre = "Nữ";
                }
            }
            else
            {
                profile.Genre = "Nam";
            }

            profile.Ethnic = Request.Form["ethnic"].ToString();
            profile.Religion = Request.Form["religion"].ToString();

            if (Request.Form["active"].ToString() == "on")
            {
                profile.Active = true;
            }
            else
            {
                profile.Active = false;
            }

            if (profileRepository.Add(profile) != 0)
            {
                notificatedMessage = "Thêm profile thành công";
                return true;
            }
            else
            {
                notificatedMessage = "Thêm profile không thành công";
                return false;
            }
        }
    }
}