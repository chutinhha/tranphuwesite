﻿using System;
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
                var newGV = dataEntities.GiaoViens.Single(a => a.IDGiaoVien == giaoVien.IDGiaoVien);
                newGV.HoGV = giaoVien.HoGV;
                newGV.TenGV = giaoVien.TenGV;
                newGV.Email = giaoVien.Email;
                newGV.DienThoai = giaoVien.DienThoai;
                newGV.BoMon = giaoVien.BoMon;
                newGV.NgaySinh = giaoVien.NgaySinh;
                newGV.AnhDaiDien = giaoVien.AnhDaiDien;
                newGV.DiaChi = giaoVien.DiaChi;
                newGV.Active = giaoVien.Active;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.GiaoVien giaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.Attach(giaoVien);
                dataEntities.DeleteObject(giaoVien);
                return dataEntities.SaveChanges();
            }
        }
        public int Delete(int id)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    var appC = dataEntities.GiaoViens.Single(gv => gv.IDGiaoVien == id);
                    dataEntities.DeleteObject(appC);
                    return dataEntities.SaveChanges();
                }
                catch (Exception)
                {
                    return -1;
                }
            }
        }

        public List<WebPortal.Model.GiaoVien> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.GiaoViens.OrderBy(gv=>gv.IDGiaoVien).Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion

        //Ai can ham gi thi viet them
    }
}