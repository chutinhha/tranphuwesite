using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminViewLogs : System.Web.UI.Page
    {
        public WebPortal.Repository.User userRepository = new Repository.User();
        public WebPortal.Repository.Log logRepository = new Repository.Log();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Model.User> list = userRepository.All();
                ddlUserList.DataSource = list;
                ddlUserList.DataValueField = "UserID";
                ddlUserList.DataTextField = "UserName";
                ddlUserList.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    int userID = Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0);
                    for (int i = 0; i < ddlUserList.Items.Count; i++)
                    {
                        if (list[i].UserID == userID)
                        {
                            ddlUserList.SelectedIndex = i;
                            break;
                        }
                    }
                }
            }
        }
    }
}