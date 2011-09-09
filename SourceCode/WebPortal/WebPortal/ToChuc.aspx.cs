using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPortal
{
    public partial class ToChuc1 : System.Web.UI.Page
    {
        public int idToChuc;
        public WebPortal.ToChuc apptochuc = new WebPortal.ToChuc();
        public WebPortal.Model.ToChuc tc = new Model.ToChuc();
        public WebPortal.ToChuc_GiaoVien apptcgv = new ToChuc_GiaoVien();
        public List<WebPortal.Model.ToChuc_GiaoVien> list;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            idToChuc = int.Parse(Request.QueryString["idToChuc"]);
            tc = apptochuc.Single(idToChuc);
            list = apptcgv.ListTCGV(idToChuc);

        }
    }
}