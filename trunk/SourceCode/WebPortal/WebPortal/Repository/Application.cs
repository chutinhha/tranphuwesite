using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Web.UI;
using System.Text;

namespace WebPortal.Repository
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
                //return dataEntities.Applications.OrderBy(app => app.Parent_Id).OrderBy(app => app.Order).ToList();
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

        #region Duong
        public List<Model.Application> GetAllAppByUser(int userID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return (from inroles in dataEntities.InRoles
                        join apps in dataEntities.Applications
                        on inroles.ApplicationID equals apps.ApplicationID
                        join groups in
                            (from ingroups in dataEntities.InGroups
                             join groups in dataEntities.Groups
                             on ingroups.GroupID equals groups.GroupID
                             where ingroups.UserID == userID
                             select groups)
                        on inroles.GroupID equals groups.GroupID
                        select apps).Distinct().ToList();
            }
        }

        public List<Model.Application> GetAllAppByParentID(int parentID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Applications.Where(app => app.Parent_Id == parentID).OrderBy(app => app.Order).ToList();
            }
        }

        public StringBuilder DoSearchingRecursion(List<Model.Application> appList, ref StringBuilder stringBuilder)
        {
            if (appList.Count == 0)
            {
                return stringBuilder;
            }
            else
            {
                stringBuilder.Append("<ul>");
                foreach (var app in appList)
                {
                    List<Model.Application> list = GetAllAppByParentID(app.Parent_Id.Value);
                    stringBuilder.Append("<li><a href='" + app.Application_FilePath + "'/>" + app.Application_Name + "</a></li>");
                    DoSearchingRecursion(list, ref stringBuilder);
                }
                stringBuilder.Append("</ul>");
            }
            return stringBuilder;
        }
        #endregion

        public void Delete(int applicationID)
        {
            throw new NotImplementedException();
        }
    }
}