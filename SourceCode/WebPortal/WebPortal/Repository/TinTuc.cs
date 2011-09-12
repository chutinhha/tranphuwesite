using System;
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
                return dataEntities.TinTucs.Single(tt => tt.IDTinTuc == idTinTuc);
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
                dataEntities.SaveChanges(); 
                int idTinTuc= tinTuc.IDTinTuc;
                return idTinTuc;
            }
        }

        public int Update(WebPortal.Model.TinTuc tinTuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newTT = dataEntities.TinTucs.Single(a => a.IDTinTuc == tinTuc.IDTinTuc);
                newTT.IDLoaiTin = tinTuc.IDLoaiTin;
                newTT.TenTinTuc = tinTuc.TenTinTuc;
                newTT.MoTaTinTuc = tinTuc.MoTaTinTuc;
                newTT.NoiDung = tinTuc.NoiDung;
                newTT.NgayDang = tinTuc.NgayDang;
                newTT.NguoiDang = tinTuc.NguoiDang;
                newTT.HinhAnh = tinTuc.HinhAnh;
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
                return dataEntities.TinTucs.OrderBy(tt=>tt.IDTinTuc).Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion

        //Ai can ham gi thi viet them, 


        #region Thuy
        public int Delete(int id)
        {  
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var news = dataEntities.TinTucs.Single(tt => tt.IDTinTuc == id);
                dataEntities.DeleteObject(news);
                return dataEntities.SaveChanges();

            }
        }

        public List<WebPortal.Model.TinTuc> GetListFollowIdLoaiTin(int idLoaiTin)
        {
            List<WebPortal.Model.TinTuc> list = new List<Model.TinTuc>();
            foreach (WebPortal.Model.TinTuc tt in All())
            {
                if (tt.IDLoaiTin == idLoaiTin)
                    list.Add(tt);
            }
            return list;
        }



        #endregion


        #region hue

        public List<WebPortal.Model.TinTuc> ListNews(int idLoaiTin)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                
                return dataEntities.TinTucs.Where(app => app.IDLoaiTin == idLoaiTin).ToList();
            }
        }
        #endregion

    }
}