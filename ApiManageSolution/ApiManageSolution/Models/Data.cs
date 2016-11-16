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

        public class Search
        {
            public string obj { get; set; }
            public string col { get; set; }
            public string val { get; set; }

            public static IEnumerable<Object> Filter(Search search)
            {
                try
                {
                    string sqlwhere = "";
                    if (search.col.Split('~').Length > 0)
                    {
                        foreach (var item in search.col.Split('~'))
                        {
                            if (sqlwhere == "")
                            {
                                sqlwhere += "\nWHERE " + item + "";
                            }
                            sqlwhere += "||" + item + "";
                        }
                        sqlwhere += " ILIKE '%" + search.val + "%'";
                        sqlwhere += "\nLIMIT 50";
                    }
                    switch (search.obj)
                    {
                        case "nhomkhos":
                            return Nhomkhos.GetAll(sqlwhere);
                        default:
                            return null;
                    }
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

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
                return GetAll("\nWHERE 1=1");
            }
            public static IEnumerable<Users> GetAll(string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Users> lts = new List<Users>();
                    string sql = "";
                    sql = "SELECT iduser, username_, password_, hoten, ngaysinh, diachi, sdt, email, ngay, ngayud, loaiuser " +
                    "\nFROM users" + v_where;
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
            public string userid { get; set; }
            public static IEnumerable<Nhomkhos> GetAll()
            {
                return GetAll("\nWHERE 1=1");
            }
            public static IEnumerable<Nhomkhos> GetAll(string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Nhomkhos> lts = new List<Nhomkhos>();
                    string sql = "";
                    sql = "SELECT id,ma,stt,ten,userid "
                    + "\nFROM dmnhomkho" + v_where;
                    //+ "\nLIMIT 50";

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
                            item.userid = dr["userid"].ToString();
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
            public string nhomkho { get; set; }
            public string ma { get; set; }
            public string stt { get; set; }
            public string ten { get; set; }
            public string ghichu { get; set; }
            public static IEnumerable<Khos> GetAll()
            {
                return GetAll("\nWHERE 1=1");
            }
            public static IEnumerable<Khos> GetAll(string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Khos> lts = new List<Khos>();
                    string sql = "";
                    sql = "SELECT a.id, a.ma, a.stt, a.ten, a.ghichu, a.id_nhomkho, b.ten as nhomkho"
                    + "\nFROM dmkho a" 
                    + "\nLEFT JOIN dmnhomkho b on b.id = a.id_nhomkho"
                    + v_where;
                    ds = dbHelper.getDataSetbySql(sql);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Khos item = new Khos();
                            item.id = dr["id"].ToString();
                            item.id_nhomkho = dr["id_nhomkho"].ToString();
                            item.nhomkho = dr["nhomkho"].ToString();
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
            public string stt { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public string dang { get; set; }
            public string hamluong { get; set; }
            public string donvidg { get; set; }
            public string donvisd { get; set; }
            public string hoatchat { get; set; }
            public string thanhphan { get; set; }
            public string tyle1 { get; set; }
            public string tyle2 { get; set; }
            public string tinhtrang { get; set; }
            public string atc { get; set; }
            public string route { get; set; }
            public string generic { get; set; }
            public string userid { get; set; }
            public string stt_40 { get; set; }
            public string sodk { get; set; }
            public string ngay { get; set; }
            public string ngayud { get; set; }
            public string id_loaiduoc { get; set; }
            public string ten_loaiduoc { get; set; }
            public string id_hangsx { get; set; }
            public string ten_hangsx { get; set; }
            public string id_quocgia { get; set; }
            public string ten_quocgia { get; set; }
            public string id_duongdung { get; set; }
            public string ten_duongdung { get; set; }
            public static IEnumerable<Thuocs> GetAll()
            {
                return GetAll("\nWHERE 1=1");
            }
            public static IEnumerable<Thuocs> GetAll(string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Thuocs> lts = new List<Thuocs>();
                    string sql = "";
                    sql = "SELECT a.id, a.stt, a.ma, a.ten, a.dang, a.hamluong, a.donvidg, a.donvisd, " +
                    "\na.hoatchat, a.thanhphan, a.tyle1, a.tyle2, a.tinhtrang, a.atc, a.route, " +
                    "\na.generic, a.userid, a.stt_40, a.sodk, " +
                    "\nto_char(a.ngay, 'dd/mm/yyyy hh24:mi') as ngay, to_char(a.ngayud, 'dd/mm/yyyy hh24:mi') as ngayud, a.id_loaiduoc, b.ten as ten_loaiduoc," +
                    "\na.id_hangsx, c.ten as ten_hangsx, a.id_quocgia, d.ten as ten_quocgia, a.id_duongdung, e.ten as ten_duongdung" +
                    "\nFROM dmduoc a" +
                    "\nLEFT JOIN dmloaiduoc b ON b.id = a.id_loaiduoc" +
                    "\nLEFT JOIN dmhangsx c ON c.id = a.id_hangsx" +
                    "\nLEFT JOIN dmquocgia d ON d.id = a.id_quocgia" +
                    "\nLEFT JOIN dmduongdung e ON e.id = a.id_duongdung" + v_where;
                    //"\nAND A.ID IN (4819,4817,4820,4434,4818,4154) LIMIT 500";
                    //+ "\nLIMIT 1500";
                    ds = dbHelper.getDataSetbySql(sql);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Thuocs item = new Thuocs();
                            item.id = dr["id"].ToString();
                            item.id_loaiduoc = dr["id_loaiduoc"].ToString();
                            item.stt = dr["stt"].ToString();
                            item.ma = dr["ma"].ToString();
                            item.ten = dr["ten"].ToString().Replace("\"","'");
                            item.dang = dr["dang"].ToString();
                            item.hamluong = dr["hamluong"].ToString();
                            item.donvidg = dr["donvidg"].ToString();
                            item.donvisd = dr["donvisd"].ToString();
                            item.hoatchat = dr["hoatchat"].ToString();
                            item.thanhphan = dr["thanhphan"].ToString();
                            item.tyle1 = dr["tyle1"].ToString();
                            item.tyle2 = dr["tyle2"].ToString();
                            item.tinhtrang = dr["tinhtrang"].ToString();
                            item.atc = dr["atc"].ToString();
                            item.route = dr["route"].ToString();
                            item.generic = dr["generic"].ToString();
                            item.userid = dr["userid"].ToString();
                            item.stt_40 = dr["stt_40"].ToString();
                            item.sodk = dr["sodk"].ToString();
                            item.ngay = dr["ngay"].ToString();
                            item.ngayud = dr["ngayud"].ToString();
                            item.id_loaiduoc = dr["id_loaiduoc"].ToString();
                            item.ten_loaiduoc = dr["ten_loaiduoc"].ToString();
                            item.id_hangsx = dr["id_hangsx"].ToString();
                            item.ten_hangsx = dr["ten_hangsx"].ToString();
                            item.id_quocgia = dr["id_quocgia"].ToString();
                            item.ten_quocgia = dr["ten_quocgia"].ToString();
                            item.id_duongdung = dr["id_duongdung"].ToString();
                            item.ten_duongdung = dr["ten_duongdung"].ToString();
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