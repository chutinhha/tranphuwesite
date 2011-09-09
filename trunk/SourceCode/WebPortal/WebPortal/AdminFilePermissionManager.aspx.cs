using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class AdminFilePermissionManager : System.Web.UI.Page
    {
        public WebPortal.Repository.Group groupRepository = new Repository.Group();
        public WebPortal.Repository.Permission permissionRepository = new Repository.Permission();
        public WebPortal.Repository.FilePermission filePermissionRepository = new Repository.FilePermission();
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

        public bool IsInsidePermissionList(int permissionID, List<Model.Permission> list)
        {
            if (list != null)
            {
                foreach (var permission in list)
                {
                    if (permission.PermissionID == permissionID)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }
}