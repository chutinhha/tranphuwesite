using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess.DataProvider
{
    public abstract class DBExecute
    {
        public abstract DataTable FillDataTable(string spName, List<SqlParameter> Sqlparams);
        public abstract DataTable FillDataTable(string sqlquery);
        public abstract IDataReader ExecuteReader(string spName, List<SqlParameter> Sqlparams);
        public abstract IDataReader ExecuteReader(string sqlquery);
        public abstract DataSet FillDataSet(string spName, List<SqlParameter> Sqlparams);
        public abstract DataSet FillDataSet(string sqlquery);
        public abstract object ExecuteScalar(string spName, List<SqlParameter> Sqlparams);
        public abstract int ExecuteNonQuery(string spName, List<SqlParameter> Sqlparams);
        public abstract int ExecuteNonQuery(string sqlquery);
    }
}
