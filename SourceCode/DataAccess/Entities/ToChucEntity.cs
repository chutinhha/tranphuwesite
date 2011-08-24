using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataAccess.Entities
{
    public class ToChucEntity
    {
        private int _MaTC;

        public int MaTC
        {
            get { return _MaTC; }
            set { _MaTC = value; }
        }
        private string _TenToChuc;

        public string TenToChuc
        {
            get { return _TenToChuc; }
            set { _TenToChuc = value; }
        }
        private string _MoTa;

        public string MoTa
        {
            get { return _MoTa; }
            set { _MoTa = value; }
        }

        public ToChucEntity() { }

        public ToChucEntity(int maTC, string tenTC, string mota)
        {
            this.MaTC = maTC;
            this.TenToChuc = tenTC;
            this.MoTa = mota;
        }
    }
}
