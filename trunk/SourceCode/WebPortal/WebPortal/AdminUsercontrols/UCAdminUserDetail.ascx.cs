using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libs;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminUserEdit : System.Web.UI.UserControl
    {
        public WebPortal.Repository.User userRepository = new Repository.User();
        public WebPortal.Repository.Profile profileRepository = new Repository.Profile();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool UpdateUser(ref string notificatedMessage)
        {
            int id = Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0);
            Model.User user = userRepository.Single(id);

            if (!string.IsNullOrWhiteSpace(Request.Form["email"].ToString()))
            {
                user.Email = Request.Form["email"].ToString();
            }

            if (!string.IsNullOrWhiteSpace(Request.Form["newpassword"].ToString()))
            {
                user.Password = Libs.HtmlHelpers.Truncate(Libs.LibSecurity.EncodePassword(Request.Form["newpassword"]), 50);
                user.LastPasswordChange = DateTime.Now;
            }

            if (!string.IsNullOrWhiteSpace(Request.Form["user-string"]))
            {
                user.User_ToString = Request.Form["user-string"];
            }

            if (!string.IsNullOrWhiteSpace(Request.Form["description"]))
            {
                user.Type = Request.Form["description"];
            }

            user.Active = true;
            if (userRepository.Update(user) != 0)
            {
                notificatedMessage = "Cập nhật người dùng thành công";
                return true;
            }
            else
            {
                notificatedMessage = "Cập nhật người dùng không thành công";
                return false;
            }
        }

        public bool InsertUser(ref string notificatedMessage)
        {

            Model.User user = new Model.User();

            if (!string.IsNullOrWhiteSpace(Request.Form["username"].ToString()))
            {
                if (this.IsUsernameExisted(Request.Form["username"].ToString()))
                {
                    notificatedMessage = "Tên đăng nhập đã được sử dụng!";
                    return false;
                }
                user.UserName = Request.Form["username"];
            }

            if (!string.IsNullOrWhiteSpace(Request.Form["email"]))
            {
                user.Email = Request.Form["email"].ToString();
            }

            if (!string.IsNullOrWhiteSpace(Request.Form["password"]))
            {
                user.Password = Libs.HtmlHelpers.Truncate(Libs.LibSecurity.EncodePassword(Request.Form["password"].ToString()), 50);
                user.LastPasswordChange = DateTime.Now;
            }

            if (!string.IsNullOrWhiteSpace(Request.Form["user-string"]))
            {
                user.User_ToString = Request.Form["user-string"];
            }

            if (!string.IsNullOrWhiteSpace(Request.Form["description"]))
            {
                user.Type = Request.Form["description"];
            }

            user.Active = true;
            user.DateCreate = DateTime.Now;

            if (userRepository.Add(user) != 0)
            {
                notificatedMessage = "Thêm người dùng thành công";
                return true;
            }
            else
            {
                notificatedMessage = "Thêm người dùng không thành công";
                return false;
            }
        }

        public WebPortal.Model.User GetUserByID(int id)
        {
            return userRepository.Single(id);
        }

        public bool IsUsernameExisted(string username)
        {
            return userRepository.CheckUsernameExist(username);
        }
    }
}