using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminUserEdit : System.Web.UI.UserControl
    {
        public WebPortal.Repository.User userRepository = new Repository.User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public WebPortal.Model.User GetUserByID(int id)
        {
            return userRepository.Single(id);
        }
    }
}