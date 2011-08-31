using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal.Repository
{
    public class InGroup
    {
        public Model.InGroup Single(int inGroupID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.InGroups.Single(inGroup => inGroup.InGroupID == inGroupID);
            }
        }

        public List<Model.InGroup> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.InGroups.ToList();
            }
        }

        public int Add(Model.InGroup inGroup)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToInGroups(inGroup);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(Model.InGroup inGroup)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newInGroup = dataEntities.InGroups.Single(a => a.InGroupID == inGroup.InGroupID);
                newInGroup.UserID = inGroup.UserID;
                newInGroup.GroupID = inGroup.GroupID;
                newInGroup.DateCreate = inGroup.DateCreate;
                newInGroup.Active = inGroup.Active;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(Model.InGroup inGroup)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(inGroup);
                return dataEntities.SaveChanges();
            }
        }

        public List<Model.InGroup> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.InGroups.Skip(start).Take(numberRecords).ToList();
            }
        }

        //Ham viet them tai day
    }
}