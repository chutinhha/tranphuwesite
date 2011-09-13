
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
                int idTaiNguyen = Convert.ToInt32(Request.QueryString["idTaiNguyen"]);
                int idTinTuc = Convert.ToInt32(Request.QueryString["idNews"]);
                DeleteTaiNguyenAttached(idTaiNguyen, idTinTuc);
                string url = "AdminNewsManager.aspx?type=attach&idNews=" + idTinTuc;
                Response.Redirect(url);
            }
        }

        protected void UploadFile_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                HttpPostedFile objectFile = FileUploadControl.PostedFile;
                string pathDirectory = "~/UpLoadFiles/";
                string errorMess = "";
                string filename = Path.GetFileName(FileUploadControl.FileName);
                string formatFileName = "rar,doc,docx,xls,xlsx,ppt,pptx,zip";
                int maxsize = 102400;
                Libs.LibUpload.UploadFile(objectFile, pathDirectory, ref errorMess, ref filename, formatFileName, maxsize);
                StatusLabel.Text = errorMess;
                FileNameAttach.Text = filename;
            }
        }
        private void AddTaiNguyen(string filename, string name, string summary)
        {
            string path = Server.MapPath("~/UpLoadFiles/") + filename;
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
                StatusSaveChange.Text = "Attach File status: Attach cuccess!";
            }
            catch(Exception ex)
            {
                StatusSaveChange.Text = "Add New TaiNguyen Falled. The following error occured: " + ex.Message;
            }
        }
    
        protected void AddTaiNguyen_Click(object sender, EventArgs e)
        {
            AddTaiNguyen(FileNameAttach.Text, FileName.Text, summaryFile.Text);

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
                WebPortal.TaiNguyen_TinTuc tnTinTuc = new TaiNguyen_TinTuc();
                WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
                foreach (WebPortal.Model.TaiNguyen_TinTuc tnTT in tnTinTuc.GetFollowIDTinTuc(idTinTuc))
                {
                    if (tnTT.IDTaiNguyen == idTaiNguyen)
                        tnTinTuc.Delete(tnTT.ID);
                }
                taiNguyen.Delete(idTaiNguyen);
                DeleteStatus.Text = "Delete Status: cuccessful!";
            }
            catch (Exception ex)
            {
                DeleteStatus.Text = "Delete Status : " + ex.Message;
            }
        }
    }
}