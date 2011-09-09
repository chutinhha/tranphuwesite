using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal.Repository
{
    public partial class Permission
    {
        #region Duong
        public Model.Permission Single(int permissionID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    return dataEntities.Permissions.Single(log => log.PermissionID == permissionID);
                }
                catch
                {

                    return null;
                }
            }
        }

        public List<Model.Permission> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Permissions.ToList();
            }
        }

        public int Add(Model.Permission permission)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToPermissions(permission);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(Model.Permission permission)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newPermission = dataEntities.Permissions.Single(per => per.PermissionID == permission.PermissionID);
                newPermission.Name = permission.Name;
                newPermission.Descritption = permission.Descritption;
                newPermission.Permission_ToString = permission.Permission_ToString;
                newPermission.Active = permission.Active;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(Model.Permission permission)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(permission);
                return dataEntities.SaveChanges();
            }
        }

        public List<Model.Permission> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Permissions.Skip(start).Take(numberRecords).ToList();
            }
        }
        #endregion

        //Ham viet them tai day

        #region Nhat
        public int Delete(int permissionID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    var newPermission = dataEntities.Permissions.Single(log => log.PermissionID == permissionID);
                    newPermission.Active = false;
                    return dataEntities.SaveChanges();
                }
                catch
                {
                    return -1;
                }
            }
        }
        #endregion

        #region Duong
        public List<Model.Permission> GetAllPermissionByGroupID(int groupID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return (from permissions in dataEntities.Permissions
                        join filePermissions in dataEntities.FilePermissions
                        on permissions.PermissionID equals filePermissions.PermissionID
                        where filePermissions.GroupID == groupID
                        select permissions).ToList();
            }
        }
        #endregion
    }
}