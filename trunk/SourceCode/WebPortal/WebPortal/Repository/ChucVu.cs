using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal
{
    public partial class ChucVu
    {
        #region Nhat
        /// <summary>
        /// Lay 1 ChucVu
        /// </summary>
        /// <param name="idChucVu"></param>
        /// <returns>ChucVu</returns>
        public WebPortal.Model.ChucVu Single(int idChucVu)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ChucVus.Single(app => app.IDCV == idChucVu);
            }
        }
        /// <summary>
        /// Lay tac ca ChucVu hien co
        /// </summary>
        /// <returns>List<ChucVu></returns>
        public List<WebPortal.Model.ChucVu> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ChucVus.ToList();
            }
        }
        /// <summary>
        /// Them mot ChucVu
        /// </summary>
        /// <param name="chucVu"></param>
        /// <returns>1:Thanh cong</returns>
        public int Add(WebPortal.Model.ChucVu chucVu)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToChucVus(chucVu);
                return dataEntities.SaveChanges();
            }
        }
        /// <summary>
        /// Thay doi thong tin chu vu
        /// </summary>
        /// <param name="chucVu"></param>
        /// <returns>1:Thanh cong</returns>
        public int Update(WebPortal.Model.ChucVu chucVu)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newCV = dataEntities.ChucVus.Single(a => a.IDCV == chucVu.IDCV);
                newCV.TenCV = chucVu.TenCV;
                newCV.MoTa = chucVu.MoTa;
                return dataEntities.SaveChanges();
            }
        }
        /// <summary>
        /// Xoa Chuc Vu
        /// </summary>
        /// <param name="chucVu"></param>
        /// <returns>1:Thanh cong</returns>
        public int Delete(WebPortal.Model.ChucVu chucVu)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(chucVu);
                return dataEntities.SaveChanges();
            }
        }
        /// <summary>
        /// Phan trang
        /// </summary>
        /// <param name="start">Bat Dau</param>
        /// <param name="numberRecords">So ban ghi tren 1 trang</param>
        /// <returns></returns>
        public List<WebPortal.Model.ChucVu> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.ChucVus.Skip(start).Take(numberRecords).ToList();
            }
        } 
        #endregion

        //Ai can ham gi thi viet them

        #region hue
        public int Delete(int id)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                try
                {
                    var appC = dataEntities.ChucVus.Single(cv => cv.IDCV == id);
                    dataEntities.DeleteObject(appC);
                    return dataEntities.SaveChanges();
                }
                catch (Exception)
                {
                    return -1;
                }
            }
        }
        #endregion
    }
}