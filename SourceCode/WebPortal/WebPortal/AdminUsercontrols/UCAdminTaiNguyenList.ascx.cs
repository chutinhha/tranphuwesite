﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class UCAdminTaiNguyenList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "delete")
            {
                try
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    DeleteNews(id);
                    Response.Redirect("AdminTaiNguyen.aspx");
                    //Response.Write("Delete success!");                    
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
        public List<WebPortal.Model.TaiNguyen> GetAll()
        {
            WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
            return taiNguyen.All();
        }
        public void DeleteNews(int id)
        {
            WebPortal.TaiNguyen_TinTuc taiNguyenTinTuc = new TaiNguyen_TinTuc();
            WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
            List<WebPortal.Model.TaiNguyen_TinTuc> list = taiNguyenTinTuc.GetFollowIDTaiNguyen(id);
            foreach (WebPortal.Model.TaiNguyen_TinTuc tntt in list)
            {
                taiNguyenTinTuc.Delete(tntt.ID);
            }
            taiNguyen.Delete(id);
        }
    }
}