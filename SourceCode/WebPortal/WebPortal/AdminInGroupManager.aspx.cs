using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminInGroupManager : System.Web.UI.Page
    {
        public WebPortal.Repository.User userRepository = new Repository.User();
        public WebPortal.Repository.Group groupRepository = new Repository.Group();
        public WebPortal.Repository.InGroup ingroupRepository = new Repository.InGroup();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUserList.DataSource = userRepository.All();
                ddlUserList.DataValueField = "UserID";
                ddlUserList.DataTextField = "UserName";
                ddlUserList.DataBind();
            }
        }

        public bool IsInsideGroupList(int groupID, List<Model.Group> list)
        {
            if (list != null)
            {
                foreach (var g in list)
                {
                    if (g.GroupID == groupID)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }
}