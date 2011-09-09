using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminApplicationDetail : System.Web.UI.UserControl
    {
        public WebPortal.Repository.Application applicationDA = new Repository.Application();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public bool UpdateApplication(ref string notificatedMessage)
        {
            try
            {
                WebPortal.Model.Application p = new Model.Application();
                p.ApplicationID = Libs.LibConvert.ConvertToInt(Request.Form["applicationID"], 0);
                if (!string.IsNullOrEmpty(Request.Form["name"].ToString()))
                    p.Application_Name = Request.Form["name"];
                else
                { return false; }
                p.Application_Description = Request.Form["description"];
                p.Application_FilePath = Request.Form["filePath"];
                p.Application_ToString = Request.Form["applicationToString"];
                if (Request.Files[0] != null)
                {
                    HttpPostedFile file = Request.Files[0];
                    if (file.FileName != "")
                    {
                        string fileName = string.Empty;
                        string path = "~/Resources/Images/";
                        if (!Libs.LibUpload.UploadFile(file, path, ref notificatedMessage, ref fileName, "jpg,jpeg,png,gif", 50000))
                        {
                            return false;
                        }
                        p.Application_Image = "/Resources/Images/" + fileName;
                    }
                   else
                         p.Application_Image=applicationDA.Single(p.ApplicationID).Application_Image;
                }
                else
                {
                    p.Application_Image = null;
                }
                p.Parent_Id = Libs.LibConvert.ConvertToInt(Request.Form["slParentID"].ToString(), 0);
                p.Order = Libs.LibConvert.ConvertToInt(Request.Form["order"].ToString(), 0);
                if (Request.Form["active"] != null)
                {
                    p.Active = true;
                }
                else
                    p.Active = false;
                applicationDA.Update(p);
                return true;
            }
            catch
            {
                notificatedMessage = "Có lỗi xảy ra trong quá trình cập nhập dữ liệu";
                return false;
            }
          
               
        }
        public bool DeleteApplication(ref string notificatedMessage)
        {
            int applicationID = Libs.LibConvert.ConvertToInt(Request.Form["applicationID"],0);
            if (applicationID != 0)
            {
                int rs = applicationDA.Delete(applicationID);
                if (rs != -1)
                {
                    notificatedMessage = "Cập nhật thành công!";
                    return true;
                }
                else
                {
                    notificatedMessage = "Không thể xóa thành công!";
                    return false;
                }
            }
            else
            {
                notificatedMessage = "Không thể xóa thành công!";
                return false;
            }

        }
    }
}