using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Helpers
{
    public class dbHelper
    {
        private static string ConnectionStringDefault = "Server=localhost;Port=5435;Database=ms_root;User Id=msolution;Password=msolution;TIMEOUT=15;POOLING=True;MINPOOLSIZE=1;MAXPOOLSIZE=20;COMMANDTIMEOUT=20;";
        public static DataSet getDataSetbySql(string SqlQuery)
        {
            try
            {
                return getDataSetbySql(SqlQuery, ConnectionStringDefault);
            }
            catch (Exception)
            {
                return null;
            }
        }

        public static DataSet getDataSetbySql(string SqlQuery, string connstr)
        {
            DataSet ds = new DataSet();
            try
            {
                using (NpgsqlConnection conn = new NpgsqlConnection(connstr))
                {
                    conn.Open();

                    NpgsqlCommand cmd = new NpgsqlCommand(SqlQuery, conn);

                    NpgsqlDataAdapter adapter = new NpgsqlDataAdapter(cmd);
                    adapter.Fill(ds);

                    conn.Close();
                    return ds;
                }
            }
            catch (Exception ex)
            {
                //ds.Tables[0].Columns.Add("Error");
                //ds.Tables[0].Rows[0]["Error"] = ex.Message;
                return null;
            }
        }

        public static bool ExecuteQuery(string SqlQuery)
        {
            try
            {
                return ExecuteQuery(SqlQuery, ConnectionStringDefault);
            }
            catch (Exception)
            {
                return false;
            }

        }

        public static bool ExecuteQuery(string SqlQuery, string connstr)
        {
            try
            {
                using (NpgsqlConnection conn = new NpgsqlConnection(connstr))
                {
                    conn.Open();

                    NpgsqlCommand cmd = new NpgsqlCommand(SqlQuery, conn);
                    cmd.ExecuteNonQuery();

                    conn.Close();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static string getFieldbyWhere(string table, string field, string where)
        {
            try
            {
                return getFieldbyWhere(table, field, where, ConnectionStringDefault);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public static string getFieldbyWhere(string table, string field, string where, string connstr)
        {
            try
            {
                DataSet ds = new DataSet();
                using (NpgsqlConnection conn = new NpgsqlConnection(connstr))
                {
                    conn.Open();

                    NpgsqlCommand cmd = new NpgsqlCommand("select " + field + " from " + table + " where " + where + "", conn);

                    NpgsqlDataAdapter adapter = new NpgsqlDataAdapter(cmd);
                    adapter.Fill(ds);

                    conn.Close();
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        return ds.Tables[0].Rows[0][0].ToString();
                    }
                    else
                    {
                        return "";
                    }
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}