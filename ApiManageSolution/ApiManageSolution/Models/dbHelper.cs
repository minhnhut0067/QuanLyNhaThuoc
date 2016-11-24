using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ApiManageSolution.Models
{
    public class dbHelper
    {
        private static string ConnectionStringDefault = "Server=localhost;Port=5435;Database=ms_root;User Id=msolution;Password=msolution;TIMEOUT=15;POOLING=True;MINPOOLSIZE=1;MAXPOOLSIZE=20;COMMANDTIMEOUT=20;";
        //private static string ConnectionStringDefault = "Server=localhost;Port=5444;Database=ms_root;User Id=msolution;Password=msolution;TIMEOUT=15;POOLING=True;MINPOOLSIZE=1;MAXPOOLSIZE=20;COMMANDTIMEOUT=20;";
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

        public static int ExecuteQuery(string SqlQuery)
        {
            try
            {
                return ExecuteQuery(SqlQuery, ConnectionStringDefault);
            }
            catch (Exception)
            {
                return 0;
            }

        }

        public static int ExecuteQuery(string SqlQuery, string connstr)
        {
            try
            {
                using (NpgsqlConnection conn = new NpgsqlConnection(connstr))
                {
                    conn.Open();

                    NpgsqlCommand cmd = new NpgsqlCommand(SqlQuery, conn);
                    int e = cmd.ExecuteNonQuery();

                    conn.Close();
                    return e;
                }
            }
            catch (Exception ex)
            {
                return 0;
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