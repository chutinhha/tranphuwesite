using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal.Repository
{
    public partial class Group
    {
        #region Duong
        public Model.Group Single(int groupID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Groups.Single(g => g.GroupID == groupID);
            }
        }

        public List<Model.Group> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Groups.ToList();
            }
        }

        public int Add(Model.Group group)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToGroups(group);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(Model.Group group)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newGroup = dataEntities.Groups.Single(a => a.GroupID == group.GroupID);
                newGroup.GroupID = group.GroupID;
                newGroup.Group_Name = group.Group_Name;
                newGroup.Group_Description = group.Group_Description;
                newGroup.Group_DateCreate = group.Group_DateCreate;
                newGroup.Group_ToString = group.Group_ToString;
                newGroup.User_Create = group.User_Create;
                newGroup.Active = group.Active;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(Model.Group group)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(group);
                return dataEntities.SaveChanges();
            }
        }

        public List<Model.Group> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Groups.Skip(start).Take(numberRecords).ToList();
            }
        }
        #endregion

        //Ham viet them tai day
    }
}