
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminNewsList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "delete")
            {
                try
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    DeleteNews(id);
                    Response.Redirect("AdminNewsManager.aspx");
                    //Response.Write("Delete success!");                    
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            
        }

        public List<WebPortal.Model.TinTuc> GetAllNews()
        {
            WebPortal.TinTuc tinTuc = new TinTuc();
            return tinTuc.All();
        }

        public void DeleteNews(int id)
        {
            int temp = 0;
            WebPortal.TinTuc tinTuc = new TinTuc();
            WebPortal.TaiNguyen_TinTuc taiNguyenTinTuc = new TaiNguyen_TinTuc();
            WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
            List<WebPortal.Model.TaiNguyen_TinTuc> list = taiNguyenTinTuc.GetFollowIDTinTuc(id);
            foreach (WebPortal.Model.TaiNguyen_TinTuc tntt in list)
            {
                temp = Libs.LibConvert.ConvertToInt(tntt.IDTaiNguyen,0);
                taiNguyenTinTuc.Delete(tntt.ID);
                taiNguyen.Delete(temp);
            }
            tinTuc.Delete(id);
        }
    }
}
