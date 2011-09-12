using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Data.Common;

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
                newLT.LoaiTin_Lv1ID = loaiTin.LoaiTin_Lv1ID;
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
        #region Thuy
        public List<WebPortal.Model.LoaiTin> GetListFollowIDLoaiTin_Lv1(int idLoaiTin_Lv1)
        {
            List<WebPortal.Model.LoaiTin> list = new List<Model.LoaiTin>();
            foreach (WebPortal.Model.LoaiTin lt in All())
            {
                if (lt.LoaiTin_Lv1ID == idLoaiTin_Lv1)
                    list.Add(lt);
            }
            return list;
        }

        public int Delete(int idLoaiTin)
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
                    var loaiTin = dataEntities.LoaiTins.Single(lt => lt.IDLoaiTin == idLoaiTin);
                    dataEntities.LoaiTins.DeleteObject(loaiTin);
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