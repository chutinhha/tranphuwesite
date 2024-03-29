﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminLoaiTinEdit : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["type"] == "edit" && !IsPostBack)
            {
                int idLoaiTin_Lv1 = Convert.ToInt32(Request.QueryString["id"]);
                LoadThongTinLoaiTin_Lv1(idLoaiTin_Lv1);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int idLoaiTin_Lv1 = Convert.ToInt32(Request.QueryString["id"]);
            WebPortal.Repository.LoaiTinLV1 lt = new Repository.LoaiTinLV1();
            WebPortal.Model.LoaiTin_Lv1 loaiTin_Lv1 = lt.Single(idLoaiTin_Lv1);

            loaiTin_Lv1.MoTa = Summary.Text;
            loaiTin_Lv1.TenLoai = Name.Text;
            try
            {

                lt.Update(loaiTin_Lv1);
                SaveChange.Text = "Lưu thành công!";
            }
            catch (Exception ex)
            {
                SaveChange.Text = "Quá trình lưu xảy ra lỗi! Vui lòng thử lại.";
            }
        }

        public bool UpdateLoaiTin()
        {
            int idLoaiTin_Lv1 = Convert.ToInt32(Request.QueryString["id"]);
            WebPortal.Repository.LoaiTinLV1 lt = new Repository.LoaiTinLV1();
            WebPortal.Model.LoaiTin_Lv1 loaiTin_Lv1 = lt.Single(idLoaiTin_Lv1);

            loaiTin_Lv1.MoTa = Summary.Text;
            loaiTin_Lv1.TenLoai = Name.Text;
            try
            {
                lt.Update(loaiTin_Lv1);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public void LoadThongTinLoaiTin_Lv1(int idLoaiTin_Lv1)
        {
            WebPortal.Repository.LoaiTinLV1 lt = new Repository.LoaiTinLV1();
            WebPortal.Model.LoaiTin_Lv1 loaiTin_Lv1 = lt.Single(idLoaiTin_Lv1);
            Name.Text = loaiTin_Lv1.TenLoai;
            Summary.Text = loaiTin_Lv1.MoTa;
        }

        public List<WebPortal.Model.LoaiTin> GetListLoaiTinFollowIdLoaiTin_Lv1(int idLoaiTin_Lv1)
        {
            WebPortal.LoaiTin loaiTin = new LoaiTin();
            return loaiTin.GetListFollowIDLoaiTin_Lv1(idLoaiTin_Lv1);
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLoaiTinManager.aspx");
        }
    }
}