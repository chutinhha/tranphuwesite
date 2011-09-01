using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal.Repository
{
    public partial class InRole
    {
        #region Duong
        public Model.InRole Single(int inRoleID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.InRoles.Single(inRole => inRole.InRolesID == inRoleID);
            }
        }

        public List<Model.InRole> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.InRoles.ToList();
            }
        }

        public int Add(Model.InRole inRole)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToInRoles(inRole);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(Model.InRole inRole)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newInRole = dataEntities.InRoles.Single(a => a.InRolesID == inRole.InRolesID);
                newInRole.ApplicationID = inRole.ApplicationID;
                newInRole.GroupID = inRole.GroupID;
                newInRole.DateCreate = inRole.DateCreate;
                newInRole.Active = inRole.Active;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(Model.InRole inRole)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(inRole);
                return dataEntities.SaveChanges();
            }
        }

        public List<Model.InRole> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.InRoles.Skip(start).Take(numberRecords).ToList();
            }
        }
        #endregion

        //Ham viet them tai day
    }
}