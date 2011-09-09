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
                try
                {
                    return dataEntities.Applications.Single(app => app.ApplicationID == applicationID);
                }
                catch (Exception)
                {
                    return null;
                }
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
        public List<Model.Application> GetAllApplicationByGroupID(int groupID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return (from apps in dataEntities.Applications
                        join inroles in dataEntities.InRoles
                        on apps.ApplicationID equals inroles.ApplicationID
                        where inroles.GroupID == groupID
                        select apps).ToList();
            }
        }

        public List<Model.Application> GetAllAppByParentID(int parentID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Applications.Where(app => app.Parent_Id == parentID).OrderBy(app => app.Order).ToList();
            }
        }

        public StringBuilder DoSearchingRecursion(List<Model.Application> appList, ref StringBuilder stringBuilder, ref bool first, ref bool active)
        {
            if (appList.Count == 0)
            {
                return stringBuilder;
            }
            else
            {
                if (first)
                {
                    stringBuilder.Append("<ul class='clear'>");
                    first = false;
                }
                else
                {
                    stringBuilder.Append("<ul>");
                }

                foreach (var app in appList)
                {
                    List<Model.Application> list = GetAllAppByParentID(app.ApplicationID);
                    if (!this.HasChildren(app))
                    {
                        if (active)
                        {
                            stringBuilder.Append("<li class='active'><a href='" + app.Application_FilePath + "'/>" + app.Application_Name + "</a></li>");
                            active = false;
                        }
                        else
                        {
                            stringBuilder.Append("<li><a href='" + app.Application_FilePath + "'/>" + app.Application_Name + "</a></li>");
                        }
                        DoSearchingRecursion(list, ref stringBuilder, ref first, ref active);
                    }
                    else
                    {
                        if (active)
                        {
                            stringBuilder.Append("<li class='active'>");
                        }
                        else
                        {
                            stringBuilder.Append("<li>");
                        }
                        DoSearchingRecursion(list, ref stringBuilder, ref first, ref active);
                        stringBuilder.Append("</li>");
                    }
                }
                stringBuilder.Append("</ul>");
            }
            return stringBuilder;
        }

        private bool HasChildren(Model.Application app)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                if (dataEntities.Applications.Where(a => a.Parent_Id.Value == app.ApplicationID).Count() > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        #endregion

        public int Delete(int applicationID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    var appC = dataEntities.Applications.Single(app => app.ApplicationID == applicationID);
                    appC.Active = false;
                    return dataEntities.SaveChanges();
                }
                catch (Exception)
                {
                    return -1;
                }
            }
        }
        public void GetAll_ApplicationID_Name(ref List<string> lstName, ref List<int> lstID)
        {
            foreach (WebPortal.Model.Application app in All())
            {
                lstName.Add(app.Application_Name);
                lstID.Add(app.ApplicationID);
            }
        }
    }
}