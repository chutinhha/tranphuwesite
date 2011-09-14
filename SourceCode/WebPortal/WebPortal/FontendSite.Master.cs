using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libs;

namespace WebPortal
{
    public partial class FontendSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<string> LayHinhAnh()
        {
            int count = 0;
            List<string> kq = new List<string>();
            WebPortal.TaiNguyen taiNguyen = new TaiNguyen();
            List<WebPortal.Model.TaiNguyen> listAll = taiNguyen.All();
            List<WebPortal.Model.TaiNguyen> listTN = taiNguyen.Paging(0, listAll.Count, listAll);
            foreach (WebPortal.Model.TaiNguyen tn in listTN)
            {
                if (KiemTraFileHinh(tn.Path))
                {
                    kq.Add(tn.Path);
                    count++;
                }
                if (count > 15)
                    break;
            }
            return kq;
        }
        public bool KiemTraFileHinh(string path)
        {
          List<string>str=  LibUpload.ListSpilit(path, '/');
          string duoi = str[str.Count - 1].ToString();
          List<string> strDuoi = LibUpload.ListSpilit(duoi, '.');
          return LibUpload.CheckExtention("jpg,jpeg,gif,png", strDuoi[strDuoi.Count-1].Trim());
        }
    }
}