using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class ToChuc
    {
        #region Nhat
        public WebPortal.Model.ToChuc Single(int idToChuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ToChucs.Single(app => app.IDToChuc == idToChuc);
            }
        }

        public List<WebPortal.Model.ToChuc> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ToChucs.ToList();
            }
        }

        public int Add(WebPortal.Model.ToChuc toChuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToToChucs(toChuc);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.ToChuc toChuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var app = dataEntities.ToChucs.Single(a => a.IDToChuc == toChuc.IDToChuc);
                app.TenTC = toChuc.TenTC;
                app.MoTa = toChuc.MoTa;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.ToChuc toChuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(toChuc);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.ToChuc> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ToChucs.Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion

        //Ai can ham gi thi viet them
    }
}