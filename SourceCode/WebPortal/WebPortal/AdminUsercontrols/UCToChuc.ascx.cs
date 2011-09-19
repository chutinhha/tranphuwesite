using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCToChuc : System.Web.UI.UserControl
    {
        public WebPortal.Model.ToChuc tc = new Model.ToChuc();
        public WebPortal.ToChuc apptc = new ToChuc();
        public List<WebPortal.Model.ToChuc> lstTc = new List<Model.ToChuc>();
       public string idToChuc;
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (IsPostBack != true)
            {
                LoadDS();
            }
        }
        void LoadDS()
        {
            lstTc = apptc.All();
            Repeater1.DataSource = lstTc;
            Repeater1.DataBind();
            btnThem.Visible = true;
            btncapnhat.Visible = false;
        }

        protected void txttentochuc_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            lbthongbao.Visible = true;
            tc.TenTC = txttentochuc.Text;
            tc.MoTa = txtmota.Text;
            int i = apptc.Add(tc);
            if (i == 0)
                lbthongbao.Text = "Không thêm được tổ chức này";
            else
                lbthongbao.Text = "Thêm thành công tổ chức";
            LoadDS();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label1.Visible = true;
            lbthongbao.Visible = false;
            WebPortal.Model.ToChuc tc1 = new Model.ToChuc();
            idToChuc = e.CommandArgument.ToString();
            tc1 = apptc.Single(Convert.ToInt32(idToChuc));

            idAn.Value = idToChuc;
            if (e.CommandName.CompareTo("Xoa") == 0)
            {
                int i=apptc.Delete(Convert.ToInt32(idToChuc));
               if(i ==1)
                   Label1.Text="Xóa thành công tổ chức";
                else
                   Label1.Text="Không xóa được tổ chức này";

               LoadDS();
            }
            else if (e.CommandName.CompareTo("Sua") == 0)
            {
                txtmota.Text = tc1.MoTa;
                txttentochuc.Text = tc1.TenTC;
                btncapnhat.Visible = true;
                btnThem.Visible = false;

            }
        }

        protected void btncapnhat_Click(object sender, EventArgs e)
        {

            Label1.Visible = false;
            lbthongbao.Visible = true;
            try
            {
                tc.IDToChuc =Libs.LibConvert.ConvertToInt(idAn.Value,1);
                tc.TenTC = txttentochuc.Text;
                tc.MoTa = txtmota.Text;
                apptc.Update(tc);
                LoadDS();
                lbthongbao.Text = "cập nhật thành công";
            }
            catch
            {
                lbthongbao.Text = "cập nhật không thành công";
            }
        }


    }
}