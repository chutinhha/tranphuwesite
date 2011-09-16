using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminResetPass : System.Web.UI.Page
    {
        public WebPortal.Repository.User userRepository = new Repository.User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public bool ResetPassword(string email, ref string notificatedMess)
        {
            try
            {
                if (userRepository.CheckEmailExist(email))
                {
                    var user = userRepository.GetUserByEmail(email);
                    string newPass = Libs.LibSecurity.GenerateRandomString(8);
                    user.Password = Libs.HtmlHelpers.Truncate(Libs.LibSecurity.EncodePassword(newPass),50);
                    user.LastPasswordChange = DateTime.Now;
                    if (userRepository.Update(user) != 0)
                    {
                        Libs.LibMail mail = new Libs.LibMail();
                        mail.IsHtml = true;
                        mail.Subject = "Khôi phục mật khẩu vào Website trường THPT Trần Phú";
                        mail.Content = "<p>Xin chào bạn, đây password đăng nhập mới:</p>";
                        mail.Content = "<p>Username: " + user.UserName + "</p>";
                        mail.Content += "<p>Password: " + newPass + "</p>";
                        mail.ListMailSend = new List<string>();
                        mail.ListMailSend.Add(email);
                        if (Libs.LibMail.Send(mail))
                        {
                            notificatedMess = "Vui lòng truy cập email để lấy lại mật khẩu đăng nhập";
                            return true;
                        }
                        else
                        {
                            notificatedMess = "Gửi email thất bại, vui lòng thử lại";
                            return false;
                        }
                    }
                    else
                    {
                        notificatedMess = "Không thể cập nhật mật khẩu người dùng, vui lòng thử lại";
                        return false;
                    }
                }
                else
                {
                    notificatedMess = "Email này không tồn tại trong hệ thống";
                    return false;
                }
            }
            catch
            {
                notificatedMess = "Có lỗi xảy ra trong quá trình khôi phục mật khẩu";
                return false;
            }
        }
    }
}