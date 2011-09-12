using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminSite : System.Web.UI.MasterPage
    {
        WebPortal.Repository.Application appRepository = new WebPortal.Repository.Application();
        WebPortal.Repository.User userRepository = new WebPortal.Repository.User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public bool CheckDecentralization(string filePath)
        {
            string filepath = Request.Path.Substring(1, Request.Path.Length - 1);
            if (filepath != "NoAccess.aspx")
            {
                int userID = userRepository.GetUserIDByUsername(Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN).ToString());
                List<WebPortal.Model.Application> AppList = appRepository.GetAllAppByUser(userID);
                var app = appRepository.GetApplicationByFilePath(filepath);
                if (app == null)
                    return false;
                foreach (var ap in AppList)
                {
                    if (ap.ApplicationID == app.ApplicationID)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }
}