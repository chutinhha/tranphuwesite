using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class AdminPermissionDetail : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public WebPortal.Repository.Permission permissionDA = new Repository.Permission();
        public bool UpdatePermission(ref string notice)
        {
            WebPortal.Model.Permission p = new WebPortal.Model.Permission();
            try
            {
                p.PermissionID = Libs.LibConvert.ConvertToInt(Request.Form["permissionID"], 0);
                if (p.PermissionID != 0)
                {
                    p.Name = Request.Form["name"];
                    p.Descritption = Request.Form["description"];
                    p.Permission_ToString = Request.Form["permissionToString"];
                    if (Request.Form["active"] != null)
                    {
                        p.Active = true;
                    }
                    else
                        p.Active = false;
                    if (permissionDA.Update(p) != 1)
                    {
                        notice = "Có lỗi xảy ra trong quá trình cập nhật thông tin của permission này!";
                        return false;
                    }
                    else
                        return true;
                }
                else
                {
                    notice = "Không tìm thấy permission này!";
                    return false;
                }
            }
            catch
            {
                notice = "Có lỗi xảy ra trong quá trình cập nhật thông tin của permission này!";
                return false;
            }


        }
        public bool DeletePermission(ref string notice)
        {
            try
            {
                int permissionID = Libs.LibConvert.ConvertToInt(Request.Form["permissionID"], 0);
                if (permissionID != 0)
                {
                    if (permissionDA.Delete(permissionID) != 1)
                    {
                        notice = "Có lỗi xảy ra trong quá trình xóa permission này!";
                        return false;
                    }
                    else
                        return true;
                }
                else
                    return false;
            }
            catch (Exception)
            {
                notice = "Có lỗi xảy ra trong quá trình xóa permission này!";
                return false;
            }
        }
        public bool AddPermission(ref string notice)
        {
            WebPortal.Model.Permission newP = new WebPortal.Model.Permission();
            try
            {
                newP.Name = Request.Form["name"];
                newP.Descritption = Request.Form["description"];
                newP.Permission_ToString = Request.Form["permissionToString"];
                if (Request.Form["active"] != null)
                {
                    newP.Active = true;
                }
                else
                    newP.Active = false;
                if (permissionDA.Add(newP) != 1)
                {
                    notice = "Có lỗi xảy ra khi thêm permission này!";
                    return false;
                }
                else
                    return true;
            }
            catch
            {
                 notice = "Có lỗi xảy ra khi thêm permission này!";
                    return false;
            }
        }
    }
}