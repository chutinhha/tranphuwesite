using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Data.Common;

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

        #region Duong
        public bool DecentralizeGroupWithApps(int groupID, List<int> appIDList)
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

                    //Delete old data for apps & groups
                    var oldInRoleList = dataEntities.InRoles;
                    foreach (var inrole in oldInRoleList)
                    {
                        if (inrole.GroupID == groupID && appIDList.Contains(inrole.ApplicationID))
                        {
                            dataEntities.InRoles.DeleteObject(inrole);
                        }
                    }

                    //Insert new data for apps & groups
                    foreach (var id in appIDList)
                    {
                        var newInRole = new Model.InRole();
                        newInRole.ApplicationID = id;
                        newInRole.GroupID = groupID;
                        newInRole.DateCreate = DateTime.Now;
                        newInRole.Active = true;
                        dataEntities.InRoles.AddObject(newInRole);
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