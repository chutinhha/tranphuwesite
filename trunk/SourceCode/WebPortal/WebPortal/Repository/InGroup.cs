using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Data.Common;

namespace WebPortal.Repository
{
    public class InGroup
    {
        #region Duong
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
        #endregion

        #region Duong
        public bool DecentralizeUserWithGroups(int userID, List<int> groupIDList)
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

                    //Delete old data for groups & user
                    var oldInGroupList = dataEntities.InGroups;
                    foreach (var ingroup in oldInGroupList)
                    {
                        if (ingroup.UserID == userID)
                        {
                            dataEntities.InGroups.DeleteObject(ingroup);
                        }
                    }

                    //Insert new data for groups & user
                    foreach (var id in groupIDList)
                    {
                        var newInGroup = new Model.InGroup();
                        newInGroup.UserID = userID;
                        newInGroup.GroupID = id;
                        newInGroup.DateCreate = DateTime.Now;
                        newInGroup.Active = true;
                        dataEntities.InGroups.AddObject(newInGroup);
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