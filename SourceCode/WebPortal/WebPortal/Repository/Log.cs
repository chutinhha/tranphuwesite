using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Data.Common;

namespace WebPortal.Repository
{
    public partial class Log
    {
        #region Duong
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
        #endregion

        //Ham viet them tai day
        #region

        public static void WriteLog(HttpRequest request)
        {
            if (Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN) != null)
            {
                Repository.Application applicationRepository = new Repository.Application();
                Repository.User userRepository = new Repository.User();
                string applicationPath = request.Path.Substring(1, request.Path.Length - 1);
                var app = applicationRepository.GetApplicationByFilePath(applicationPath);
                int userID = userRepository.GetUserIDByUsername(Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN).ToString());
                Model.Log log = new Model.Log();
                log.UserID = userID;
                log.Trace = applicationPath;
                log.Date = DateTime.Now;
                if (app != null)
                {
                    log.Action = app.Application_Description;
                }
                if (request.ServerVariables["REMOTE_ADDR"] != null)
                {
                    log.IP = request.ServerVariables["REMOTE_ADDR"].ToString();
                }
                log.Time_Login = DateTime.Now;

                if (Libs.LibSession.Get(Libs.Constants.LOG) != null)
                {
                    var list = (List<Model.Log>)Libs.LibSession.Get(Libs.Constants.LOG);
                    list.Add(log);
                    Libs.LibSession.Set(Libs.Constants.LOG, list);
                }
                else
                {
                    List<Model.Log> LogList = new List<Model.Log>();
                    LogList.Add(log);
                    Libs.LibSession.Set(Libs.Constants.LOG, LogList);
                }
            }
        }
        #endregion
    }
}