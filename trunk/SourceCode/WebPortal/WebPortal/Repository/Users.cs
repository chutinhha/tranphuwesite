using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal.Repository
{
    public partial class User
    {
        public Model.User Single(int userID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Users.Single(user => user.UserID == userID);
            }
        }

        public List<Model.User> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Users.ToList();
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
                var newUser = dataEntities.Users.Single(u => u.UserID == user.UserID);
                newUser.UserName = user.UserName;
                newUser.User_ToString = user.User_ToString;
                newUser.Type = user.Type;
                newUser.Password = user.Password;
                newUser.LastPasswordChange = user.LastPasswordChange;
                newUser.LastLoginDate = user.LastLoginDate;
                newUser.Email = user.Email;
                newUser.Active = user.Active;
                newUser.DateCreate = user.DateCreate;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(Model.User user)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(user);
                return dataEntities.SaveChanges();
            }
        }

        public List<Model.User> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Users.Skip(start).Take(numberRecords).ToList();
            }
        }
        
        //Ham viet them tai day
    }
}