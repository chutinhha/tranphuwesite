using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminLoaiTinList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "delete")
            {
                try
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    DeleteLoaiTin_Lv1(id);
                    Response.Redirect("AdminLoaiTinManager.aspx");
                    //Response.Write("Delete success!");                    
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            
        }

        public void DeleteLoaiTin_Lv1(int idLoaiTin_Lv1)
        {
            WebPortal.LoaiTin_Lv1 loaiTin = new LoaiTin_Lv1();
            loaiTin.Delete(idLoaiTin_Lv1);
        }

        //public void DeleteLoaiTin_Lv1(int id)
        //{
        //    WebPortal.LoaiTin_Lv1 loaiLin_Lv1 = new LoaiTin_Lv1();
        //    List<WebPortal.Model.LoaiTin> listLoaiTin = new List<Model.LoaiTin>();
        //    WebPortal.LoaiTin loaiTin = new LoaiTin();
        //    listLoaiTin = loaiTin.GetListFollowIDLoaiTin_Lv1(id);
           
        //    foreach(WebPortal.Model.LoaiTin lt in listLoaiTin)
        //    {
        //        DeleteLoaiTin(lt.IDLoaiTin);
        //    }            
        //    loaiLin_Lv1.Delete(id);
        //}


        //public void DeleteTaiNguyen(int id)
        //{
        //    WebPortal.TaiNguyen tn = new TaiNguyen();
        //    tn.Delete(id);
        //}

        //public void DeleteTaiNguyen_TinTuc(int id)
        //{
        //    WebPortal.TaiNguyen_TinTuc tntt = new TaiNguyen_TinTuc();
        //    tntt.Delete(id);
        //}

        //public void DeleteTinTuc(int id)
        //{
        //    int temp = 0;
        //    WebPortal.TinTuc tinTuc = new TinTuc();
        //    WebPortal.TaiNguyen_TinTuc taiNguyenTinTuc = new TaiNguyen_TinTuc();
        //    WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
        //    List<WebPortal.Model.TaiNguyen_TinTuc> list = taiNguyenTinTuc.GetFollowIDTinTuc(id);
        //    foreach (WebPortal.Model.TaiNguyen_TinTuc tntt in list)
        //    {
        //        temp = Libs.LibConvert.ConvertToInt(tntt.IDTaiNguyen,0);
        //        taiNguyenTinTuc.Delete(tntt.ID);
        //        taiNguyen.Delete(temp);
        //    }
        //    tinTuc.Delete(id);
        //}

        //public void DeleteLoaiTin(int id)
        //{
        //    WebPortal.LoaiTin loaiTin = new LoaiTin();
        //    List<WebPortal.Model.TinTuc> listTinTuc = new List<Model.TinTuc>();
        //    WebPortal.TinTuc tinTuc = new TinTuc();
        //    listTinTuc = tinTuc.GetListFollowIdLoaiTin(id);
        //    foreach (WebPortal.Model.TinTuc tt in listTinTuc)
        //    {
        //        DeleteTinTuc(tt.IDTinTuc);
        //    }
        //    loaiTin.Delete(id);
        //}
        public List<WebPortal.Model.LoaiTin_Lv1> GetAllLoaiTin()
        {
            WebPortal.LoaiTin_Lv1 loaiTin = new LoaiTin_Lv1();
            return loaiTin.All();
        }

    }
}