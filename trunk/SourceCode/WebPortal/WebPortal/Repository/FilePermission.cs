using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal.Repository
{
    public partial class FilePermission
    {
        #region Duong
        public Model.FilePermission Single(int filePermissionID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.FilePermissions.Single(filePermission => filePermission.FilePermissionID == filePermissionID);
            }
        }

        public List<Model.FilePermission> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.FilePermissions.ToList();
            }
        }

        public int Add(Model.FilePermission filePermission)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToFilePermissions(filePermission);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(Model.FilePermission filePermission)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newFilePermission = dataEntities.FilePermissions.Single(a => a.FilePermissionID == filePermission.FilePermissionID);
                newFilePermission.PermissionID = filePermission.PermissionID;
                newFilePermission.GroupID = filePermission.GroupID;
                newFilePermission.FolderPath = filePermission.FolderPath;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(Model.FilePermission filePermission)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(filePermission);
                return dataEntities.SaveChanges();
            }
        }

        public List<Model.FilePermission> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.FilePermissions.Skip(start).Take(numberRecords).ToList();
            }
        }
        #endregion

        //Ham viet them tai day
    }
}