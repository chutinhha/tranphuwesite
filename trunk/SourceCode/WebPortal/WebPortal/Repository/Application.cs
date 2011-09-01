using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class Application
    {
        #region Duong
        public WebPortal.Model.Application Single(int applicationID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Applications.Single(app => app.ApplicationID == applicationID);
            }
        }

        public List<WebPortal.Model.Application> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Applications.ToList();
            }
        }

        public int Add(WebPortal.Model.Application application)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToApplications(application);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.Application application)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var app = dataEntities.Applications.Single(a => a.ApplicationID == application.ApplicationID);
                app.Application_Name = application.Application_Name;
                app.Application_ToString = application.Application_ToString;
                app.Application_Image = application.Application_Image;
                app.Application_FilePath = application.Application_FilePath;
                app.Application_Description = application.Application_Description;
                app.Application_DateCreate = application.Application_DateCreate;
                app.Parent_Id = application.Parent_Id;
                app.Order = application.Order;
                app.Active = application.Active;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.Application application)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(application);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.Application> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Applications.Skip(start).Take(numberRecords).ToList();
            }
        }
        #endregion

        //Ai can ham gi thi viet them
    }
}