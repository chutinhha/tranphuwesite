using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal.Repository
{
    public partial class Log
    {
        public Model.Log Single(int logID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Logs.Single(log => log.LogID == logID);
            }
        }

        public List<Model.Log> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Logs.ToList();
            }
        }

        public int Add(Model.Log log)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToLogs(log);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(Model.Log log)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newLog = dataEntities.Logs.Single(lg => lg.LogID == log.LogID);
                newLog.Time_Login = log.Time_Login;
                newLog.Time_Logout = log.Time_Logout;
                newLog.UserID = log.UserID;
                newLog.Trace = log.Trace;
                newLog.IP = log.IP;
                newLog.Date = log.Date;
                newLog.Action = log.Action;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(Model.Log log)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(log);
                return dataEntities.SaveChanges();
            }
        }

        public List<Model.Log> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Logs.Skip(start).Take(numberRecords).ToList();
            }
        }

        //Ham viet them tai day
    }
}