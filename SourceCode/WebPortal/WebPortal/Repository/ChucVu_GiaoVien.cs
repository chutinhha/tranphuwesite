using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;
using System.Data.Common;

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
                var newCV_GV = dataEntities.ChucVu_GiaoVien.Single(a => a.ID == chucVu_GiaoVien.ID);
                newCV_GV.IDChucVu = chucVu_GiaoVien.IDChucVu;
                newCV_GV.IDGiaoVien = chucVu_GiaoVien.IDGiaoVien;
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
                return dataEntities.ChucVu_GiaoVien.OrderBy(cvgv => cvgv.ID).Skip(start).Take(numberRecords).ToList();
            }
        }
        #endregion
        #region hue
        public List<WebPortal.Model.ChucVu_GiaoVien> chucvu(int idGiaoVien)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ChucVu_GiaoVien.Where(app => app.IDGiaoVien == idGiaoVien).ToList();
            }
        }

        #endregion

        #region Duong
        public bool DecentralizeChucVuWithGiaoVien(int cvID, List<int> gvIDList)
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
                    var oldCV_GVList = dataEntities.ChucVu_GiaoVien;
                    foreach (var cvgv in oldCV_GVList)
                    {
                        if (cvgv.IDChucVu == cvID && gvIDList.Contains(cvgv.IDGiaoVien.Value))
                        {
                            dataEntities.ChucVu_GiaoVien.DeleteObject(cvgv);
                        }
                    }

                    //Insert new data for gv & tc
                    foreach (var id in gvIDList)
                    {
                        var newGVCV = new Model.ChucVu_GiaoVien();
                        newGVCV.IDGiaoVien = id;
                        newGVCV.IDChucVu = cvID;
                        dataEntities.ChucVu_GiaoVien.AddObject(newGVCV);
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