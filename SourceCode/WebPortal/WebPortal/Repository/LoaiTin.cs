using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class LoaiTin
    {
        #region Nhat
        public WebPortal.Model.LoaiTin Single(int idLoaiTin)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.LoaiTins.Single(app => app.IDLoaiTin == idLoaiTin);
            }
        }

        public List<WebPortal.Model.LoaiTin> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.LoaiTins.ToList();
            }
        }

        public int Add(WebPortal.Model.LoaiTin loaiTin)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToLoaiTins(loaiTin);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.LoaiTin loaiTin)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newLT = dataEntities.LoaiTins.Single(a => a.IDLoaiTin == loaiTin.IDLoaiTin);
                newLT.TenLoai = loaiTin.TenLoai;
                newLT.MoTa = loaiTin.MoTa;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.LoaiTin loaiTin)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(loaiTin);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.LoaiTin> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.LoaiTins.OrderBy(lt => lt.IDLoaiTin).Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion

        //Ai can ham gi thi viet them
        #region hue
        public List<WebPortal.Model.LoaiTin> ListNews(int idLoaiTinLV1)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {

                return dataEntities.LoaiTins.Where(app => app.LoaiTin_Lv1ID == idLoaiTinLV1).ToList();
            }
        }
        #endregion
    }
}