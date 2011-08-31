using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class ToChuc_GiaoVien
    {
        #region Nhat
        public WebPortal.Model.ToChuc_GiaoVien Single(int id)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ToChuc_GiaoVien.Single(app => app.ID == id);
            }
        }

        public List<WebPortal.Model.ToChuc_GiaoVien> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ToChuc_GiaoVien.ToList();
            }
        }

        public int Add(WebPortal.Model.ToChuc_GiaoVien toChuc_GiaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToToChuc_GiaoVien(toChuc_GiaoVien);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.ToChuc_GiaoVien toChuc_GiaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var app = dataEntities.ToChuc_GiaoVien.Single(a => a.ID == toChuc_GiaoVien.ID);
                app.IDGiaoVien = toChuc_GiaoVien.IDGiaoVien;
                app.IDToChuc = toChuc_GiaoVien.IDToChuc;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.ToChuc_GiaoVien toChuc_GiaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(toChuc_GiaoVien);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.ToChuc_GiaoVien> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ToChuc_GiaoVien.Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion
    }
}