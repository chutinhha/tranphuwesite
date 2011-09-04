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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<Model.User> GetAllUsers()
        {
            WebPortal.Repository.User userRepository = new Repository.User();
            return userRepository.All();          
        }
    }
}