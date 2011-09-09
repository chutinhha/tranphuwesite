using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        public WebPortal.Repository.User userRepository = new Repository.User();
        public WebPortal.Repository.Application appRepository = new Repository.Application();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool CheckLoginInfo(string username, string password, bool isRemember)
        {
            if (userRepository.CheckLogin(username, Libs.LibSecurity.EncodePassword(password.Trim())))
            {
                //Save in session
                Libs.LibSession.Set(Libs.Constants.ACCOUNT_LOGIN, username);
                //Save in cookie
                if (isRemember)
                {
                    Libs.LibCookie.Add(Libs.Constants.COOKIE_USERNAME, username, null);
                    Libs.LibCookie.Add(Libs.Constants.COOKIE_USERPASS, password, null);

                }
                return true;
            }
            else
                return false;
        }

        public void LogOut()
        {
            if (Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN) != null)
            {
                Libs.LibSession.Remove(Libs.Constants.ACCOUNT_LOGIN);
            }
        }

        public List<Model.Application> GetAllApplicationsByUser()
        {
            if (Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN) != null)
            {
                int userID = userRepository.GetUserIDByUsername(Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN).ToString());
                return appRepository.GetAllAppByUser(userID);
            }
            else
            {
                return null;
            }
        }
    }
}