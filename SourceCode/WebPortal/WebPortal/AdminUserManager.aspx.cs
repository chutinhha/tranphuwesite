using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPortal.Model;
using WebPortal.Repository;

namespace WebPortal
{
    public partial class AdminIndex : System.Web.UI.Page
    {
        public WebPortal.Repository.User userRepository = new Repository.User();
        public WebPortal.Repository.Profile profileRepository = new Repository.Profile();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool DeleteUser(int id, ref string notificatedMessage)
        {
            if (userRepository.Delete(id) != 0)
            {
                notificatedMessage = "Đã xóa người dùng có mã " + id;
                return true;
            }
            else
            {
                notificatedMessage = "Xóa không thành công, vui lòng thử lại";
                return false;
            }
        }

        public bool DeleteProfile(int id, ref string notificatedMessage)
        {
            if (profileRepository.Delete(id) != 0)
            {
                notificatedMessage = "Đã xóa profile";
                return true;
            }
            else
            {
                notificatedMessage = "Xóa không thành công, vui lòng thử lại";
                return false;
            }
        }
    }
}