using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class TaiNguyen
    {
        #region Nhat
        public WebPortal.Model.TaiNguyen Single(int idTaiNguyen)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.TaiNguyens.Single(app => app.IDTaiNguyen == idTaiNguyen);
            }
        }

        public List<WebPortal.Model.TaiNguyen> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.TaiNguyens.ToList();
            }
        }

        public int Add(WebPortal.Model.TaiNguyen taiNguyen)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToTaiNguyens(taiNguyen);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.TaiNguyen taiNguyen)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var app = dataEntities.TaiNguyens.Single(a => a.IDTaiNguyen == taiNguyen.IDTaiNguyen);
                app.TenTaiNguyen = taiNguyen.TenTaiNguyen;
                app.MoTa = taiNguyen.MoTa;
                app.Path = taiNguyen.Path;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.TaiNguyen taiNguyen)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(taiNguyen);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.TaiNguyen> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.TaiNguyens.Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion

        //Ai can ham gi thi viet them

    }
}