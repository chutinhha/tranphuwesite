using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class ChucVu_GiaoVien
    {
        #region Nhat
        public WebPortal.Model.ChucVu_GiaoVien Single(int id)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ChucVu_GiaoVien.Single(app => app.ID == id);
            }
        }

        public List<WebPortal.Model.ChucVu_GiaoVien> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ChucVu_GiaoVien.ToList();
            }
        }

        public int Add(WebPortal.Model.ChucVu_GiaoVien chucVu_GiaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToChucVu_GiaoVien(chucVu_GiaoVien);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.ChucVu_GiaoVien chucVu_GiaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var app = dataEntities.ChucVu_GiaoVien.Single(a => a.ID == chucVu_GiaoVien.ID);
                app.IDChucVu = chucVu_GiaoVien.IDChucVu;
                app.IDGiaoVien = chucVu_GiaoVien.IDGiaoVien;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.ChucVu_GiaoVien chucVu_GiaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(chucVu_GiaoVien);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.ChucVu_GiaoVien> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ChucVu_GiaoVien.Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion
    }
}