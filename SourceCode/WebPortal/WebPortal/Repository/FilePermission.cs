using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Data.Common;

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

        #region Duong
        public bool DecentralizeGroupWithPermission(int groupID, List<int> permissionIDList)
        {
            DbTransaction dbTransaction = null;
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    if (dataEntities.Connection.State == System.Data.ConnectionState.Closed)
                    {
                        dataEntities.Connection.Open();
                    }
                    dbTransaction = dataEntities.Connection.BeginTransaction();

                    //Delete old data for permission & groups
                    var oldFilePermissionList = dataEntities.FilePermissions;
                    foreach (var filePermission in oldFilePermissionList)
                    {
                        if (filePermission.GroupID == groupID)
                        {
                            dataEntities.FilePermissions.DeleteObject(filePermission);
                        }
                    }

                    //Insert new data for permission & groups
                    foreach (var id in permissionIDList)
                    {
                        var per = dataEntities.Permissions.Single(p => p.PermissionID == id);
                        var newFilePermission = new Model.FilePermission();
                        newFilePermission.PermissionID = id;
                        newFilePermission.GroupID = groupID;
                        newFilePermission.FolderPath = per.Name;
                        dataEntities.FilePermissions.AddObject(newFilePermission);
                    }

                    if (dataEntities.SaveChanges() != 0)
                    {
                        dbTransaction.Commit();
                        return true;
                    }
                    else
                    {
                        dbTransaction.Rollback();
                        return false;
                    }
                }
                catch
                {
                    dbTransaction.Rollback();
                    return false;
                }
                finally
                {
                    if (dataEntities.Connection.State == System.Data.ConnectionState.Open)
                    {
                        dataEntities.Connection.Close();
                    }
                }
            }
        }
        #endregion
        //Ham viet them tai day
    }
}