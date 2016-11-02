using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ApiManageSolution.Models
{
    public class Data
    {
        dbHelper dbh = new dbHelper();
        public class Users
        {
            public string iduser { get; set; }
            public string username_ { get; set; }
            public string password_ { get; set; }
            public string hoten { get; set; }
            public string ngaysinh { get; set; }
            public string diachi { get; set; }
            public string sdt { get; set; }
            public string email { get; set; }
            public string ngay { get; set; }
            public string ngayud { get; set; }
            public string loaiuser { get; set; }
            public static IEnumerable<Users> GetAll()
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Users> lts = new List<Users>();
                    string sql = "";
                    sql = "SELECT iduser, username_, password_, hoten, ngaysinh, diachi, sdt, email, ngay, ngayud, loaiuser " +
                    "\nFROM users;";
                    ds = dbHelper.getDataSetbySql(sql);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Users item = new Users();
                            item.iduser = dr["iduser"].ToString();
                            item.username_ = dr["username_"].ToString();
                            item.password_ = dr["password_"].ToString();
                            item.hoten = dr["hoten"].ToString();
                            item.ngaysinh = dr["ngaysinh"].ToString();
                            item.diachi = dr["diachi"].ToString();
                            item.sdt = dr["sdt"].ToString();
                            item.email = dr["email"].ToString();
                            item.ngay = dr["ngay"].ToString();
                            item.ngayud = dr["ngayud"].ToString();
                            item.loaiuser = dr["loaiuser"].ToString();
                            lts.Add(item);
                        }
                    }
                    return lts;
                }
                catch
                {
                    return null;
                }
            }
        }

        public class Nhomkhos
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string stt { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Nhomkhos> GetAll()
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Nhomkhos> lts = new List<Nhomkhos>();
                    string sql = "";
                    sql = "SELECT id,ma,stt,ten "
                    + "FROM dmnhomkho";
                    ds = dbHelper.getDataSetbySql(sql);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Nhomkhos item = new Nhomkhos();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
                            item.stt = dr["stt"].ToString();
                            item.ten = dr["ten"].ToString();
                            lts.Add(item);
                        }
                    }
                    return lts;
                }
                catch
                {
                    return null;
                }
            }
        }
        
        public class Khos
        {
            public string id { get; set; }
            public string id_nhomkho { get; set; }
            public string ma { get; set; }
            public string stt { get; set; }
            public string ten { get; set; }
            public string ghichu { get; set; }
            public static IEnumerable<Khos> GetAll()
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Khos> lts = new List<Khos>();
                    string sql = "";
                    sql = "SELECT id,id_nhomkho,ma,stt,ten,ghichu"
                    + "\nFROM dmkho";
                    ds = dbHelper.getDataSetbySql(sql);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Khos item = new Khos();
                            item.id = dr["id"].ToString();
                            item.id_nhomkho = dr["id_nhomkho"].ToString();
                            item.ma = dr["ma"].ToString();
                            item.stt = dr["stt"].ToString();
                            item.ten = dr["ten"].ToString();
                            item.ghichu = dr["ghichu"].ToString();
                            lts.Add(item);
                        }
                    }
                    return lts;
                }
                catch
                {
                    return null;
                }

            }
        }

        public class Thuocs
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public string tenhc { get; set; }
            public string sodk { get; set; }          
            public static IEnumerable<Thuocs> GetAll()
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Thuocs> lts = new List<Thuocs>();
                    string sql = "";
                    sql = "SELECT id,ma,ma,ten,tenhc,sodk "
                    + "\nFROM dmduoc";
                    ds = dbHelper.getDataSetbySql(sql);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Thuocs item = new Thuocs();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
                            item.ten = dr["ten"].ToString();
                            item.tenhc = dr["tenhc"].ToString();
                            item.sodk = dr["sodk"].ToString();
                            lts.Add(item);
                        }
                    }
                    return lts;
                }
                catch
                {
                    return null;
                }
            }            
        }
    }
}