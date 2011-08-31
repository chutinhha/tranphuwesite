﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class TinTuc
    {
        #region Nhat
        public WebPortal.Model.TinTuc Single(int idTinTuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.TinTucs.Single(app => app.IDTinTuc == idTinTuc);
            }
        }

        public List<WebPortal.Model.TinTuc> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.TinTucs.ToList();
            }
        }

        public int Add(WebPortal.Model.TinTuc tinTuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToTinTucs(tinTuc);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.TinTuc tinTuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newTN_TT = dataEntities.TinTucs.Single(a => a.IDTinTuc == tinTuc.IDTinTuc);
                newTN_TT.IDLoaiTin = tinTuc.IDLoaiTin;
                newTN_TT.NoiDung = tinTuc.NoiDung;
                newTN_TT.NgayDang = tinTuc.NgayDang;
                newTN_TT.NguoiDang = tinTuc.NguoiDang;
                newTN_TT.HinhAnh = tinTuc.HinhAnh;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.TinTuc tinTuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(tinTuc);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.TinTuc> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.TinTucs.Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion

        //Ai can ham gi thi viet them, 
    }
}