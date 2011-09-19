
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminUploadFile : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request.QueryString["idTaiNguyen"])>0)
            {
                string url1 = Request.Url.ToString();
                int idTaiNguyen = Convert.ToInt32(Request.QueryString["idTaiNguyen"]);
                int idTinTuc = Convert.ToInt32(Request.QueryString["idNews"]);                
                //string url = "AdminNewsManager.aspx?type=attach&idNews="+ idTinTuc;
                DeleteTaiNguyenAttached(idTaiNguyen, idTinTuc);
                //Response.Redirect(url);
            }
        }

        protected void UploadFile_Click(object sender, EventArgs e)
        {
            if (StatusLabel.Text == "Upload thành công!")
            {
                string fileName = Server.MapPath("~/Resources/Files/") + FileNameAttach.Text;
                Libs.LibFile.DeleteFile(Server.MapPath(fileName));
            }
            if (FileUploadControl.HasFile)
            {
                HttpPostedFile objectFile = FileUploadControl.PostedFile;
                string pathDirectory = "~/Resources/Files/";
                string errorMess = "";
                string filename = string.Empty;
                string formatFileName = "rar,doc,docx,xls,xlsx,ppt,pptx,zip,txt,pdf";
                int maxsize = 10240000;
                Libs.LibUpload.UploadFile(objectFile, pathDirectory, ref errorMess, ref filename, formatFileName, maxsize);
                StatusLabel.Text = errorMess;
                FileNameAttach.Text = filename;
                StatusSaveChange.Text = "";
                DeleteStatus.Text = "";
            }
        }
        private void AddTaiNguyen(string filename, string name, string summary)
        {
            string path = Server.MapPath("~/Resources/Files/") + filename;
            WebPortal.Model.TaiNguyen tn = new Model.TaiNguyen();
            tn.Path = path;
            tn.MoTa = summary;
            tn.TenTaiNguyen = name;
            WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
            try
            {
                int idTaiNguyen = taiNguyen.Add(tn);
                int idTinTuc = Convert.ToInt32(Request.QueryString["idNews"]);
                WebPortal.TaiNguyen_TinTuc tnTinTuc = new TaiNguyen_TinTuc();
                WebPortal.Model.TaiNguyen_TinTuc taiNguyenTinTuc = new Model.TaiNguyen_TinTuc();
                taiNguyenTinTuc.IDTaiNguyen = idTaiNguyen;
                taiNguyenTinTuc.IDTinTuc = idTinTuc;
                tnTinTuc.Add(taiNguyenTinTuc);
                StatusSaveChange.Text = "Đính kèm file thành công!";
                StatusLabel.Text = "";
                FileName.Text = "";
                summaryFile.Text = "";
                DeleteStatus.Text = "";
            }
            catch(Exception ex)
            {
                StatusSaveChange.Text = "Lỗi xảy ra trong khi đính kèm: " + ex.Message;
                StatusLabel.Text = "";
                FileName.Text = "";
                summaryFile.Text = "";
                DeleteStatus.Text="";
            }
        }
    
        protected void AddTaiNguyen_Click(object sender, EventArgs e)
        {
            if (StatusLabel.Text == "Upload thành công!")
            {
                AddTaiNguyen(FileNameAttach.Text, FileName.Text, summaryFile.Text);
            }
            else
            {
                StatusSaveChange.Text = "Bạn chưa đính kèm file hoặc file đính kèm không hợp lệ!";
                DeleteStatus.Text = "";
            }
        }

        public List<WebPortal.Model.TaiNguyen> GetListTaiNguyenAttached()
        {
            WebPortal.TaiNguyen_TinTuc taiNguyenTT = new TaiNguyen_TinTuc();
            List<WebPortal.Model.TaiNguyen_TinTuc> listTNTT = taiNguyenTT.GetFollowIDTinTuc(Convert.ToInt32(Request.QueryString["idNews"]));
            WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
            List<WebPortal.Model.TaiNguyen> listTaiNguyen = new List<Model.TaiNguyen>();

            foreach (WebPortal.Model.TaiNguyen_TinTuc tnTT in listTNTT)
            {
                foreach (WebPortal.Model.TaiNguyen tn in taiNguyen.All())
                {
                    if (tnTT.IDTaiNguyen == tn.IDTaiNguyen)
                        listTaiNguyen.Add(tn);
                }
            }
            return listTaiNguyen;
        }

        public void DeleteTaiNguyenAttached(int idTaiNguyen, int idTinTuc)
        {
            try
            {
                WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
                WebPortal.Model.TaiNguyen tn = taiNguyen.Single(idTaiNguyen);
                Libs.LibFile.DeleteFile(tn.Path);
                taiNguyen.Delete(idTaiNguyen);
                DeleteStatus.Text = "Xóa thành công";
            }
            catch (Exception ex)
            {
                DeleteStatus.Text = "Lỗi xảy ra khi xóa! Vui lòng thử lại.";
            }
        }
    }
}