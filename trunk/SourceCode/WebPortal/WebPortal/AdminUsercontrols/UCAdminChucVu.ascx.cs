using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminChucVu : System.Web.UI.UserControl
    {
        public WebPortal.Model.ChucVu cv = new Model.ChucVu();
        public WebPortal.ChucVu appcv = new ChucVu();
        public List<WebPortal.Model.ChucVu> lstcv = new List<Model.ChucVu>();
        public string idchucvu;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                LoadDS();
            }

        }

        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            lbthongbao.Visible = true;
            try
            {
                cv.IDCV = Libs.LibConvert.ConvertToInt(idAn.Value,1);
                cv.TenCV = txttenchucvu.Text;
                cv.MoTa = txtmota.Text;
                appcv.Update(cv);
                LoadDS();
                lbthongbao.Text = "cập nhật thành công";
            }
            catch
            {
                lbthongbao.Text = "cập nhật không thành công";
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            lbthongbao.Visible = true;
            cv.TenCV = txttenchucvu.Text;
            cv.MoTa = txtmota.Text;
            int i = appcv.Add(cv);
            if (i == 0)
                lbthongbao.Text = "Không thêm được chức vụ này";
            else
                lbthongbao.Text = "Thêm thành công chức vụ";
            LoadDS();

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            Label1.Visible = true;
            lbthongbao.Visible = false;
          
            idchucvu = e.CommandArgument.ToString();
            cv = appcv.Single(Libs.LibConvert.ConvertToInt(idchucvu,1));

            idAn.Value = idchucvu;
            if (e.CommandName.CompareTo("Xoa") == 0)
            {
                int i = appcv.Delete(Libs.LibConvert.ConvertToInt(idchucvu,1));
                if (i == 1)
                    Label1.Text = "Xóa thành công chức vụ";
                else
                    Label1.Text = "Không xóa được chức vụ";

                LoadDS();
            }
            else if (e.CommandName.CompareTo("Sua") == 0)
            {
                txtmota.Text = cv.MoTa;
                txttenchucvu.Text = cv.TenCV;
                btncapnhat.Visible = true;
                btnThem.Visible = false;

            }

        }
        void LoadDS()
        {
            lstcv = appcv.All();
            Repeater1.DataSource = lstcv;
            Repeater1.DataBind();
            btnThem.Visible = true;
            btncapnhat.Visible = false;
        }
    }
}