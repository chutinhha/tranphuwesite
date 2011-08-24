using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.DataProvider;
using DataAccess.Entities;
using System.Data;

namespace BusinessLayer
{
    public static class ToChucBL
    {
        public static SqlDBExecute sqlDBExecute = new SqlDBExecute();

        public static List<ToChucEntity> LayDanhSachToChuc()
        {
            List<ToChucEntity> ds = new List<ToChucEntity>();
            string sqlquery = "select * from ToChuc";
            DataTable dt = sqlDBExecute.FillDataTable(sqlquery);
            foreach (DataRow row in dt.Rows)
            {
                var entity = new ToChucEntity(Convert.ToInt32(row[0].ToString()), row[1].ToString(), row[2].ToString());
                ds.Add(entity);
            }
            return ds;
        }

        public static bool ThemToChuc()
        {
            string sqlquery = "INSERT INTO ToChuc(TenToChuc,MoTa) VALUES('" + "ABC','abc')";
            if (sqlDBExecute.ExecuteNonQuery(sqlquery) != 0)
                return true;
            else
                return false;
        }
    }
}
