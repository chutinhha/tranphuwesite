﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class AdminApplicationDetail : System.Web.UI.UserControl
    {
        public WebPortal.Repository.Application applicationDA = new Repository.Application();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public bool UpdateApplication(ref string notificatedMessage)
        {
            try
            {
                WebPortal.Model.Application p = new Model.Application();
                p.ApplicationID = Libs.LibConvert.ConvertToInt(Request.Form["applicationID"], 0);
                if (!string.IsNullOrEmpty(Request.Form["name"].ToString()))
                    p.Application_Name = Request.Form["name"];
                else
                { return false; }
                p.Application_Description = Request.Form["description"];
                p.Application_FilePath = Request.Form["filePath"];
                p.Application_ToString = Request.Form["applicationToString"];
                if (Request.Files[0] != null)
                {
                    HttpPostedFile file = Request.Files[0];
                    string fileName = string.Empty;
                    string path = "~/Resources/Images/";
                    if (!Libs.LibUpload.UploadFile(file, path, ref notificatedMessage, ref fileName, "jpg,jpeg,png,gif", 50000))
                    {
                        return false;
                    }
                    p.Application_Image = "/Resources/Images/" + fileName;
                }
                else
                {
                    p.Application_Image = null;
                }
                p.Parent_Id = Libs.LibConvert.ConvertToInt(Request.Form["parentID"].ToString(), 0);
                p.Order = Libs.LibConvert.ConvertToInt(Request.Form["order"].ToString(), 0);
                if (Request.Form["active"] != null)
                {
                    p.Active = true;
                }
                else
                    p.Active = false;
                applicationDA.Update(p);
                return true;
            }
            catch
            {
                return false;
            }
          
               
        }
    }
}