using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminInRoleManager : System.Web.UI.Page
    {
        public WebPortal.Repository.Application appRepository = new Repository.Application();
        public WebPortal.Repository.Group groupRepository = new Repository.Group();
        public WebPortal.Repository.InRole inroleRepository = new Repository.InRole();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlGroupList.DataSource = groupRepository.All();
                ddlGroupList.DataValueField = "GroupID";
                ddlGroupList.DataTextField = "Group_Name";
                ddlGroupList.DataBind();
            }
        }

        public bool IsInsideApplicationList(int appID, List<Model.Application> list)
        {
            if (list != null)
            {
                foreach (var app in list)
                {
                    if (app.ApplicationID==appID)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }
}