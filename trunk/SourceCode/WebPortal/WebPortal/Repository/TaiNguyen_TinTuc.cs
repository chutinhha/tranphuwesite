using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class TaiNguyen_TinTuc
    {
        #region Nhat
        public WebPortal.Model.TaiNguyen_TinTuc Single(int id)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.TaiNguyen_TinTuc.Single(app => app.ID == id);
            }
        }

        public List<WebPortal.Model.TaiNguyen_TinTuc> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.TaiNguyen_TinTuc.ToList();
            }
        }

        public int Add(WebPortal.Model.TaiNguyen_TinTuc taiNguyen_TinTuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToTaiNguyen_TinTuc(taiNguyen_TinTuc);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.TaiNguyen_TinTuc taiNguyen_TinTuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newTN_TT = dataEntities.TaiNguyen_TinTuc.Single(a => a.ID == taiNguyen_TinTuc.ID);
                newTN_TT.IDTaiNguyen = taiNguyen_TinTuc.IDTaiNguyen;
                newTN_TT.IDTinTuc = taiNguyen_TinTuc.IDTinTuc;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.TaiNguyen_TinTuc taiNguyen_TinTuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(taiNguyen_TinTuc);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.TaiNguyen_TinTuc> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.TaiNguyen_TinTuc.Skip(start).Take(numberRecords).ToList();
            }
        }
        #endregion

        #region Thuy

        public List<WebPortal.Model.TaiNguyen_TinTuc> GetFollowIDTinTuc(int id)
        {
            List<WebPortal.Model.TaiNguyen_TinTuc> listTNTT = new List<Model.TaiNguyen_TinTuc>();
            List<WebPortal.Model.TaiNguyen_TinTuc> list = All();
            foreach (WebPortal.Model.TaiNguyen_TinTuc tnTinTuc in list)
            {
                if (tnTinTuc.IDTinTuc == id)
                    listTNTT.Add(tnTinTuc);
            }
            return listTNTT;
        }

        #endregion

        //Ai can ham gi thi viet them
    }
}