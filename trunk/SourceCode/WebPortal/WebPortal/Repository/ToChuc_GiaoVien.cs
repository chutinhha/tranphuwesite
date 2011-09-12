using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Data.Common;

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
                var newTC_GV = dataEntities.ToChuc_GiaoVien.Single(a => a.ID == toChuc_GiaoVien.ID);
                newTC_GV.IDGiaoVien = toChuc_GiaoVien.IDGiaoVien;
                newTC_GV.IDToChuc = toChuc_GiaoVien.IDToChuc;
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

        #region hue
        public List<WebPortal.Model.ToChuc_GiaoVien> ListTCGV(int idToChuc)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {

                return dataEntities.ToChuc_GiaoVien.Where(app => app.IDToChuc == idToChuc).ToList();
            }
        }
        #endregion

        #region Duong
        public bool DecentralizeToChucWithGiaoVien(int tcID, List<int> gvIDList)
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

                    //Delete old data for gv & tc
                    var oldTC_GVList = dataEntities.ToChuc_GiaoVien;
                    foreach (var tcgv in oldTC_GVList)
                    {
                        if (tcgv.IDToChuc == tcID && gvIDList.Contains(tcgv.IDGiaoVien.Value))
                        {
                            dataEntities.ToChuc_GiaoVien.DeleteObject(tcgv);
                        }
                    }

                    //Insert new data for gv & tc
                    foreach (var id in gvIDList)
                    {
                        var newGVTC = new Model.ToChuc_GiaoVien();
                        newGVTC.IDGiaoVien = id;
                        newGVTC.IDToChuc = tcID;
                        dataEntities.ToChuc_GiaoVien.AddObject(newGVTC);
                    }

                    if (dataEntities.SaveChanges() != 0)
                    {
                        dbTransaction.Commit();
                        return true;
                    }
                    else
                    {
                        dbTransaction.Rollback();
                        return false;
                    }
                }
                catch
                {
                    dbTransaction.Rollback();
                    return false;
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