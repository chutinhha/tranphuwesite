using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Data.Common;

namespace WebPortal.Repository
{
    public class LoaiTinLV1
    {
        #region hue
        public WebPortal.Model.LoaiTin_Lv1 Single(int idLoaiTinLV1)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.LoaiTin_Lv1.Single(app => app.IDLoaiTin_Lv1 == idLoaiTinLV1);
            }
        }

        public List<WebPortal.Model.LoaiTin_Lv1> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.LoaiTin_Lv1.ToList();
            }
        }

        public int Add(WebPortal.Model.LoaiTin_Lv1 loaiTinLV1)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToLoaiTin_Lv1(loaiTinLV1);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(WebPortal.Model.LoaiTin_Lv1 loaiTinLV1)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newLT = dataEntities.LoaiTin_Lv1.Single(a => a.IDLoaiTin_Lv1 == loaiTinLV1.IDLoaiTin_Lv1);
                newLT.TenLoai = loaiTinLV1.TenLoai;
                newLT.MoTa = loaiTinLV1.MoTa;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(WebPortal.Model.LoaiTin_Lv1 loaiTinLV1)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(loaiTinLV1);
                return dataEntities.SaveChanges();
            }
        }

        public List<WebPortal.Model.LoaiTin_Lv1> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.LoaiTin_Lv1.Skip(start).Take(numberRecords).ToList();
            }
        }


      
        #endregion

        #region Thuy    
        public int Delete(int idLoaiTin_Lv1)
        {
            DbTransaction dbTransaction = null;
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    if (dataEntities.Connection.State == System.Data.ConnectionState.Closed)
                    {
                        dataEntities.Connection.Open();
                    }
                    dbTransaction = dataEntities.Connection.BeginTransaction();
                    var loaiTin = dataEntities.LoaiTin_Lv1.Single(lt => lt.IDLoaiTin_Lv1 == idLoaiTin_Lv1);
                    dataEntities.LoaiTin_Lv1.DeleteObject(loaiTin);
                    if (dataEntities.SaveChanges() != 0)
                    {
                        dbTransaction.Commit();
                        return 1;
                    }
                    else
                    {
                        dbTransaction.Rollback();
                        return 0;
                    }
                }
                catch
                {
                    dbTransaction.Rollback();
                    return 0;
                }
                finally
                {
                    if (dataEntities.Connection.State == System.Data.ConnectionState.Open)
                    {
                        dataEntities.Connection.Close();
                    }
                }
            }
        }
        #endregion

    }
}