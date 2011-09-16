using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Data.Common;

namespace WebPortal.Repository
{
    public partial class User
    {
        #region Duong
        public Model.User Single(int userID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    return dataEntities.Users.Single(user => user.UserID == userID);
                }
                catch
                {
                    return null;
                }
            }
        }

        public List<Model.User> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Users.Where(user => user.Active == true).ToList();
            }
        }

        public int Add(Model.User user)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToUsers(user);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(Model.User user)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    //Update user info
                    var newUser = dataEntities.Users.Single(u => u.UserID == user.UserID);
                    newUser.UserName = user.UserName;
                    newUser.Password = user.Password;
                    newUser.Email = user.Email;
                    newUser.LastPasswordChange = user.LastPasswordChange;
                    newUser.LastLoginDate = user.LastLoginDate;
                    newUser.DateCreate = user.DateCreate;
                    newUser.User_ToString = user.User_ToString;
                    newUser.Type = user.Type;
                    newUser.LastPasswordChange = user.LastPasswordChange;
                    newUser.Active = user.Active;

                    //Save change
                    return dataEntities.SaveChanges();
                }
                catch
                {
                    return 0;
                }
            }
        }

        public List<Model.User> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Users.Skip(start).Take(numberRecords).ToList();
            }
        }
        #endregion

        //Ham viet them tai day
        #region duong
        public bool CheckUsernameExist(string username)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    var users = dataEntities.Users.Where(user => user.UserName.ToLower() == username.ToLower());
                    if (users.Count() > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }
        }

        public int Delete(int userID)
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

                    //Set active false for user
                    var user = dataEntities.Users.Single(u => u.UserID == userID);
                    user.Active = false;

                    //Set active false for profile table
                    var profileList = dataEntities.Profiles.Where(p => p.UserID == user.UserID);
                    if (profileList.Count() > 0)
                    {
                        foreach (var profile in profileList)
                        {
                            profile.Active = false;
                        }
                    }

                    //Delete log
                    var logList = dataEntities.Logs.Where(log => log.UserID == userID);
                    if (logList.Count() > 0)
                    {
                        foreach (var l in logList)
                        {
                            dataEntities.Logs.DeleteObject(l);
                        }
                    }

                    //Set active false for ingroup table
                    var ingroupList = dataEntities.InGroups.Where(g => g.UserID == userID);
                    if (ingroupList.Count() > 0)
                    {
                        foreach (var ingroup in ingroupList)
                        {
                            ingroup.Active = false;
                        }
                    }

                    if (dataEntities.SaveChanges() != 0)
                    {
                        dbTransaction.Commit();
                        return 1;
                    }
                    else
                    {
                        dbTransaction.Rollback();
                        return 0;
                    }
                }
                catch
                {
                    dbTransaction.Rollback();
                    return 0;
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

        public bool CheckLogin(string username, string password)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    var user = dataEntities.Users.Single(u => u.UserName.ToLower() == username.ToLower() && u.Password == password && u.Active == true);
                    if (user != null)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool CheckEmailExist(string email)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    var users = dataEntities.Users.Where(user => user.Email.ToLower() == email.ToLower());
                    if (users.Count() > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }
        }

        public Model.User GetUserByEmail(string email)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    return dataEntities.Users.Where(user => user.Email.ToLower()==email.ToLower()).First();
                }
                catch
                {
                    return null;
                }
            }
        }
        #endregion
        #region Nhat
        public int GetUserIDByUsername(string userName)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    return dataEntities.Users.Single(user => user.UserName == userName).UserID;
                }
                catch
                {
                    return -1;
                }
            }
        }
        #endregion
    }
}