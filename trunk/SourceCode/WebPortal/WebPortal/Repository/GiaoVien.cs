using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class GiaoVien
    {
        #region Nhat
        public WebPortal.Model.GiaoVien Single(int idGiaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.GiaoViens.Single(app => app.IDGiaoVien == idGiaoVien);
            }
        }

        public List<WebPortal.Model.GiaoVien> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.GiaoViens.ToList();
            }
        }

        public int Add(WebPortal.Model.GiaoVien giaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToGiaoViens(giaoVien);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.GiaoVien giaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var app = dataEntities.GiaoViens.Single(a => a.IDGiaoVien == giaoVien.IDGiaoVien);
                app.HoGV = giaoVien.HoGV;
                app.TenGV = giaoVien.TenGV;
                app.Email = giaoVien.Email;
                app.DienThoai = giaoVien.DienThoai;
                app.BoMon = giaoVien.BoMon;
                app.NgaySinh = giaoVien.NgaySinh;
                app.AnhDaiDien = giaoVien.AnhDaiDien;
                app.DiaChi = giaoVien.DiaChi;
                app.Active = giaoVien.Active;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.GiaoVien giaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(giaoVien);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.GiaoVien> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.GiaoViens.Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion

        //Ai can ham gi thi viet them
    }
}