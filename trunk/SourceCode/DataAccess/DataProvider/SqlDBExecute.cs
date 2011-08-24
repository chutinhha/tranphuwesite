using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace DataAccess.DataProvider
{
    public class SqlDBExecute : DBExecute
    {
        public static string connectionString;
        public static SqlConnection myConnection;

        //PTTL lấy connectionString từ webConfig
        public SqlDBExecute()
        {
            connectionString = ConfigurationManager.AppSettings["connectionString"];
        }

        //PTTL truyền vào connectionString
        public SqlDBExecute(string connString)
        {
            connectionString = connString;
        }

        /// <summary>
        /// Truy vấn dữ liệu trả về Table (1 bảng dữ liệu)
        /// Sử dụng phương thức Fill của DataAdapter: adapter.Fill(datatable)
        /// </summary>
        /// <param name="spName">Tên store procedure</param>
        /// <param name="Sqlparams">Danh sách parameter</param>
        /// <returns>DataTable</returns>
        public override DataTable FillDataTable(string spName, List<SqlParameter> Sqlparams)
        {
            DataTable dt = new DataTable();
            try
            {
                myConnection = new SqlConnection(connectionString);
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                SqlCommand command = myConnection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = spName;
                if (Sqlparams != null)
                {
                    foreach (SqlParameter p in Sqlparams)
                        command.Parameters.Add(p);
                }
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dt);
                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                if (myConnection.State == ConnectionState.Open)
                {
                    myConnection.Close();
                }
            }
        }

        /// <summary>
        /// Truy vấn dữ liệu trả về Table (1 bảng dữ liệu)
        /// Sử dụng phương thức Fill của DataAdapter: adapter.Fill(datatable)
        /// </summary>
        /// <param name="sqlquery">Câu lệnh truy vấn</param>
        /// <returns>DataTable</returns>
        public override DataTable FillDataTable(string sqlquery)
        {
            DataTable dt = new DataTable();
            try
            {
                myConnection = new SqlConnection(connectionString);
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                SqlCommand command = myConnection.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = sqlquery;
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dt);
                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                if (myConnection.State == ConnectionState.Open)
                {
                    myConnection.Close();
                }
            }
        }

        /// <summary>
        /// Truy vấn dữ liệu trả về IDataReader
        /// Sử dụng phương thức ExecuteReader của đối tượng command
        /// </summary>
        /// <param name="spName">Tên store procedure</param>
        /// <param name="sqlquery">Danh sách parameter</param>
        /// <returns>IDataReader</returns>
        public override IDataReader ExecuteReader(string spName, List<SqlParameter> Sqlparams)
        {
            try
            {
                myConnection = new SqlConnection(connectionString);
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                SqlCommand command = myConnection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = spName;
                if (Sqlparams != null)
                {
                    foreach (SqlParameter p in Sqlparams)
                        command.Parameters.Add(p);
                }
                return (command.ExecuteReader(CommandBehavior.CloseConnection));
            }
            catch
            {
                return null;
            }
            finally
            {
                if (myConnection.State == ConnectionState.Open)
                {
                    myConnection.Close();
                }
            }
        }

        /// <summary>
        /// Truy vấn dữ liệu trả về IDataReader
        /// Sử dụng phương thức ExecuteReader của đối tượng command
        /// </summary>
        /// <param name="sqlquery">Câu lệnh truy vấn</param>
        /// <returns>IDataReader</returns>
        public override IDataReader ExecuteReader(string sqlquery)
        {
            try
            {
                myConnection = new SqlConnection(connectionString);
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                SqlCommand command = myConnection.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = sqlquery;
                return (command.ExecuteReader(CommandBehavior.CloseConnection));
            }
            catch
            {
                return null;
            }
            finally
            {
                if (myConnection.State == ConnectionState.Open)
                {
                    myConnection.Close();
                }
            }
        }

        /// <summary>
        /// Truy vấn dữ liệu trả về DataSet (1 tập các table)
        /// Sử dụng phương thức Fill của DataAdapter: adapter.Fill(dataset)
        /// </summary>
        /// <param name="spName">Tên store procedure</param>
        /// <param name="Sqlparams">Danh sách parameter</param>
        /// <returns>DataSet</returns>
        public override DataSet FillDataSet(string spName, List<SqlParameter> Sqlparams)
        {
            DataSet ds = new DataSet();
            try
            {
                myConnection = new SqlConnection(connectionString);
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                SqlCommand command = myConnection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = spName;
                if (Sqlparams != null)
                {
                    foreach (SqlParameter p in Sqlparams)
                        command.Parameters.Add(p);
                }
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);
                return ds;
            }
            catch
            {
                return null;
            }
            finally
            {
                myConnection.Close();
            }
        }

        /// <summary>
        /// Truy vấn dữ liệu trả về DataSet (1 tập các table)
        /// Sử dụng phương thức Fill của DataAdapter: adapter.Fill(dataset)
        /// </summary>
        /// <param name="sqlquery">Câu lệnh truy vấn</param>
        /// <returns>DataSet</returns>
        public override DataSet FillDataSet(string sqlquery)
        {
            DataSet ds = new DataSet();
            try
            {
                myConnection = new SqlConnection(connectionString);
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                SqlCommand command = myConnection.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = sqlquery;
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(ds);
                return ds;
            }
            catch
            {
                return null;
            }
            finally
            {
                myConnection.Close();
            }
        }

        /// <summary>
        /// Truy vấn dữ liệu trả về 1 object 
        /// Sử dụng phương thức ExecuteScalar của đối tượng command
        /// </summary>
        /// <param name="spName">Tên store procedure</param>
        /// <param name="Sqlparams">Danh sách parameter</param>
        /// <returns>Trả về cột dữ liệu đầu tiên của dòng dữ liệu đầu tiên</returns>
        public override object ExecuteScalar(string spName, List<SqlParameter> Sqlparams)
        {
            try
            {
                myConnection = new SqlConnection(connectionString);
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                SqlCommand command = myConnection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = spName;
                if (Sqlparams != null)
                {
                    foreach (SqlParameter p in Sqlparams)
                        command.Parameters.Add(p);
                }
                return (command.ExecuteScalar());
            }
            catch
            {
                return null;
            }
            finally
            {
                if (myConnection.State == ConnectionState.Open)
                {
                    myConnection.Close();
                }
            }
        }

        /// <summary>
        /// Thực thi câu lệnh insert, update, delete
        /// </summary>
        /// <param name="spName">Tên store procedure<</param>
        /// <param name="Sqlparams">Danh sách parameter</param>
        /// <returns>Số dòng bị ảnh hưởng</returns>
        public override int ExecuteNonQuery(string spName, List<SqlParameter> Sqlparams)
        {
            try
            {
                myConnection = new SqlConnection(connectionString);
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                SqlCommand command = myConnection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = spName;
                if (Sqlparams != null)
                {
                    foreach (SqlParameter p in Sqlparams)
                        command.Parameters.Add(p);
                }
                return (command.ExecuteNonQuery());
            }
            catch
            {
                return 0;
            }
            finally
            {
                if (myConnection.State == ConnectionState.Open)
                {
                    myConnection.Close();
                }
            }
        }

        /// <summary>
        /// Thực thi câu lệnh insert, update, delete
        /// </summary>
        /// <param name="sqlquery">Câu lệnh truy vấn</param>
        /// <returns>Số dòng bị ảnh hưởng</returns>
        public override int ExecuteNonQuery(string sqlquery)
        {
            try
            {
                myConnection = new SqlConnection(connectionString);
                if (myConnection.State == ConnectionState.Closed)
                {
                    myConnection.Open();
                }
                SqlCommand command = myConnection.CreateCommand();
                command.CommandType = CommandType.Text;
                command.CommandText = sqlquery;
                return (command.ExecuteNonQuery());
            }
            catch
            {
                return 0;
            }
            finally
            {
                if (myConnection.State == ConnectionState.Open)
                {
                    myConnection.Close();
                }
            }
        }
    }
}
