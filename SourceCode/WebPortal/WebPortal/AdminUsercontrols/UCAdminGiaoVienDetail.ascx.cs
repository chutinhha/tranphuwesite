using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminGiaoVienDetail : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public WebPortal.GiaoVien giaovienDA = new GiaoVien();
        public bool AddGiaoVien(ref string notificatedMessage)
        {
            try
            {
                WebPortal.Model.GiaoVien g = new Model.GiaoVien();
                if (!string.IsNullOrEmpty(Request.Form["hoGV"].ToString()))
                    g.HoGV = Request.Form["hoGV"];
                else
                { return false; }
                g.TenGV = Request.Form["tenGV"];
                g.Email = Request.Form["email"];
                g.DienThoai = Request.Form["dienThoai"];
                g.BoMon = Request.Form["boMon"];
                if (Request.Files[0] != null)
                {
                    HttpPostedFile file = Request.Files[0];
                    if (file.FileName != "")
                    {
                        string fileName = string.Empty;
                        string path = "~/Resources/Images/";
                        if (!Libs.LibUpload.UploadFile(file, path, ref notificatedMessage, ref fileName, "jpg,jpeg,png,gif", 50000))
                        {
                            return false;
                        }
                        g.AnhDaiDien = "/Resources/Images/" + fileName;
                    }
                    else
                        g.AnhDaiDien = giaovienDA.Single(g.IDGiaoVien).AnhDaiDien;
                }
                else
                {
                    g.AnhDaiDien = null;
                }
                g.NgaySinh = Libs.LibConvert.ConvertToDateTime(Request.Form["ngaySinh"]).Date;
                g.DiaChi = Request.Form["diaChi"];
                if (Request.Form["active"] != null)
                {
                    g.Active = true;
                }
                else
                    g.Active = false;
                if (giaovienDA.Add(g) != 1)
                {
                    notificatedMessage = "Có lỗi xảy ra khi thêm giáo viên này!";
                    return false;
                }
                else
                    return true;
            }
            catch
            {
                notificatedMessage = "Có lỗi xảy ra! Không thể thêm được giáo viên này!";
                return false;
            }


        }
        public bool UpdateGiaoVien(ref string notificatedMessage)
        {
            try
            {
                int id = Libs.LibConvert.ConvertToInt(Request.Form["giaoVienID"], 0);
                WebPortal.Model.GiaoVien g = giaovienDA.Single(id);
                if (g != null)
                {
                    if (!string.IsNullOrEmpty(Request.Form["hoGV"].ToString()))
                        g.HoGV = Request.Form["hoGV"];
                    else
                    { return false; }
                    g.TenGV = Request.Form["tenGV"];
                    g.Email = Request.Form["email"];
                    g.DienThoai = Request.Form["dienThoai"];
                    g.BoMon = Request.Form["boMon"];
                    if (Request.Files[0] != null)
                    {
                        HttpPostedFile file = Request.Files[0];
                        if (file.FileName != "")
                        {
                            string fileName = string.Empty;
                            string path = "~/Resources/Images/";
                            if (!Libs.LibUpload.UploadFile(file, path, ref notificatedMessage, ref fileName, "jpg,jpeg,png,gif", 50000))
                            {
                                return false;
                            }
                            g.AnhDaiDien = "/Resources/Images/" + fileName;
                        }
                        else
                            g.AnhDaiDien = giaovienDA.Single(g.IDGiaoVien).AnhDaiDien;
                    }
                    else
                    {
                        g.AnhDaiDien = null;
                    }
                    g.NgaySinh = Libs.LibConvert.ConvertToDateTime(DateTime.Now);
                    g.DiaChi = Request.Form["diaChi"];
                    if (Request.Form["active"] != null)
                    {
                        g.Active = true;
                    }
                    else
                        g.Active = false;
                    if (giaovienDA.Update(g) != 1)
                    {
                        notificatedMessage = "Có lỗi xảy ra! Không thể thêm được Application";
                        return false;
                    }
                    return true;
                }
                else
                    return false;
            }
            catch
            {
                notificatedMessage = "Có lỗi xảy ra! Không thể thêm được Application";
                return false;
            }
        }
        public bool DeleteGiaoVien(ref string notificatedMessage)
        {
            int giaoVienID = Libs.LibConvert.ConvertToInt(Request.Form["giaoVienID"], 0);
            if (giaoVienID != 0)
            {
                int rs = giaovienDA.Delete(giaoVienID);
                if (rs != -1)
                {
                    notificatedMessage = "Cập nhật thành công!";
                    return true;
                }
                else
                {
                    notificatedMessage = "Không thể xóa thành công!";
                    return false;
                }
            }
            else
            {
                notificatedMessage = "Không thể xóa thành công!";
                return false;
            }

        }
    }
}