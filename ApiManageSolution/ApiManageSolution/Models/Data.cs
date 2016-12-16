using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ApiManageSolution.Models
{
    public class Data
    {
        //private static string ConnectionString = "Server=localhost;Port=5435;Database=ms_null;User Id=msolution;Password=msolution;TIMEOUT=15;POOLING=True;MINPOOLSIZE=1;MAXPOOLSIZE=20;COMMANDTIMEOUT=20;";
        private static string ConnectionString = "Server=172.168.1.244;Port=5444;Database=ms_null;User Id=msolution;Password=msolution;TIMEOUT=15;POOLING=True;MINPOOLSIZE=1;MAXPOOLSIZE=20;COMMANDTIMEOUT=20;";
        dbHelper dbh = new dbHelper();
        public class Search
        {
            public string obj { get; set; }
            public string col { get; set; }
            public string val { get; set; }
            public string request { get; set; }
            public string userid { get; set; }
            public static IEnumerable<Object> Filter(Search data)
            {
                try
                {
                    string v_where = "";
                    string v_conn = "";
                    if (data.userid != null)
                    {
                        v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                    }
                    //Filter loc
                    if (data.col != null && data.col.Split('~').Length > 0)
                    {
                        foreach (var item in data.col.Split('~'))
                        {
                            if (v_where == "")
                            {
                                v_where += "\nWHERE lower(a." + item + ")";
                            }
                            else
                            {
                                v_where += "||lower(a." + item + ")";
                            }
                        }
                        v_where += " ILIKE '%" + (data.val != null ? data.val.ToLower() : "") + "%'";
                        v_where += "\nORDER BY a.ten";
                        v_where += "\nLIMIT 50";
                    }
                    switch (data.obj)
                    {
                        #region Nhà Thốc
                        case "nhomkhos":
                            return Nhomkhos.Get(v_conn, v_where);
                        case "khos":
                            return Khos.Get(v_conn, v_where);
                        case "lydonxs":
                            return Lydonxs.Get("", v_where);
                        case "users":
                            return Users.Get(v_conn, v_where);
                        case "duongdungs":
                            return Duongdungs.Get("", v_where);
                        case "dangbds":
                            return Dangbds.Get("", v_where);
                        case "donvis":
                            return Donvis.Get("", v_where);
                        case "loaiduocs":
                            return Loaiduocs.Get(v_conn, v_where);
                        case "hangsxs":
                            return Hangsxs.Get("", v_where);
                        case "nhaccs":
                            return Nhaccs.Get("", v_where);
                        case "dmhcs":
                            return Dmhcs.Get("", v_where);
                        case "quocgias":
                            return Quocgias.Get("", v_where);
                        case "dmphais":
                            return Dmphais.Get("", v_where);
                        case "nhapkhos":
                            if (data.request != null && data.request != "")
                            {
                                v_where = "\nWHERE 1=1";
                                if (data.request.Split('~')[0] != "")
                                {
                                    v_where += "\nAND a.idlydonx=" + data.request.Split('~')[0];
                                }
                                if (data.request.Split('~')[1] != "")
                                {
                                    v_where += "\nAND a.idkho=" + data.request.Split('~')[1];
                                }
                                if (data.request.Split('~')[2] != "")
                                {
                                    v_where += "\nAND a.userid=" + data.request.Split('~')[2];
                                }
                                if (data.request.Split('~')[3] != "")
                                {
                                    v_where += "\nAND to_char(a.ngay,'yyyymmdd') >= to_char(to_date('" + data.request.Split('~')[3] + "','dd/mm/yyyy'),'yyyymmdd')";
                                }
                                if (data.request.Split('~')[4] != "")
                                {
                                    v_where += "\nAND to_char(a.ngay,'yyyymmdd') <= to_char(to_date('" + data.request.Split('~')[4] + "','dd/mm/yyyy'),'yyyymmdd')";
                                }
                            }
                            return Nhapkhos.Get(v_conn, v_where);
                        case "nhapkhocts":
                            if (data.request != null && data.request != "")
                            {
                                v_where = "\nWHERE 1=1";
                                if (data.request.Split('~')[0] != "")
                                {
                                    v_where += "\nAND a.idnhapkho=" + data.request.Split('~')[0];
                                }
                            }
                            return Nhapkhocts.Get(v_conn, v_where);
                        case "thuocs":
                            return Thuocs.Get(v_conn, v_where);
                        case "mathuocs":
                            return Thuocs.Get(v_conn, v_where);
                        #endregion
                        #region Nhân sự
                        case "phongbans":
                            return Phongbans.Get(v_conn, v_where);
                        case "nhanviens":
                            return Nhanviens.Get(v_conn, v_where);
                        #endregion
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
        public class Check
        {
            public string obj { get; set; }
            public string request { get; set; }
            public string result { get; set; }
            public string userid { get; set; }
            public static Check Checked(Check data)
            {
                switch (data.obj)
                {
                    case "nhapkhocts":
                        data.result = Nhapkhocts.Kiemtraphieunhap(data).ToString();
                        break;
                    default:
                        break;
                }
                return data;
            }
        }
        public class CreateVal
        {
            public string obj { get; set; }
            public string val { get; set; }
            public string result { get; set; }
            public string userid { get; set; }
            public static CreateVal Create(CreateVal data)
            {
                try
                {
                    string v_conn = "";
                    if (data.userid != null)
                    {
                        v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                    }
                    switch (data.obj)
                    {
                        case "khos":
                            data.result = Khos.Getma(v_conn);
                            break;
                        case "phongbans":
                            data.result = Phongbans.Getma(v_conn);
                            break;
                        case "nhanviens":
                            data.result = Nhanviens.Getid(v_conn);
                            break;
                        default:
                            break;
                    }
                    return data;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class DelRecord
        {
            public string obj { get; set; }
            public string key { get; set; }
            public bool result { get; set; }
            public string userid { get; set; }
            public static DelRecord Del(DelRecord data)
            {
                try
                {
                    switch (data.obj)
                    {
                        case "khos":
                            data.result = Khos.Del(data);
                            break;
                        case "thuocs":
                            data.result = Thuocs.Del(data);
                            break;
                        case "phongbans":
                            data.result = Phongbans.Del(data);
                            break;
                        case "nhanviens":
                            data.result = Nhanviens.Del(data);
                            break;
                        case "nhapkhos":
                            data.result = Nhapkhos.Del(data);
                            break;
                        case "nhapkhocts":
                            data.result = Nhapkhocts.Del(data);
                            break;
                        default:
                            break;
                    }
                    return data;
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
            public static IEnumerable<Users> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Users> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Users> lts = new List<Users>();
                    string sql = "";
                    sql = "SELECT a.id, a.username_, a.password_, a.hoten, a.ngaysinh, a.diachi, a.sdt, a.email, a.ngay, a.ngayud, a.loaiuser " +
                    "\nFROM users a" + v_where;
                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Users item = new Users();
                            item.iduser = dr["id"].ToString();
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
        public class Dmphais
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public string userid { get; set; }
            public static string Getid(string v_conn)
            {
                try
                {
                    string sql = "select case when max(id) is not null then max(id) + 1 else 1 end as id from dmphai";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["id"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static string Getma(string v_conn)
            {
                try
                {
                    string sql = "select 'PHA'||lpad(case when max(to_number(replace(ma,'PHA',''))) is not null then max(to_number(replace(ma,'PHA',''))) + 1 else 1 end,4,'0') as ma from dmkho";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["ma"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static IEnumerable<Dmphais> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Dmphais> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Dmphais> lts = new List<Dmphais>();
                    string sql = "";
                    sql = "SELECT a.id, a.ma, a.ten"
                    + "\nFROM dmphai a"
                    + v_where;
                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Dmphais item = new Dmphais();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
            public static IEnumerable<Dmphais> Upd(Dmphais data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Upd(v_conn, data);
            }
            public static IEnumerable<Dmphais> Upd(string v_conn, Dmphais data)
            {
                try
                {
                    var sql = "";
                    var irec = 0;
                    if (data.id == null)
                    {
                        data.id = Getid(v_conn);
                    }
                    if (data.ma == null)
                    {
                        data.ma = Getma(v_conn);
                    }
                    sql = @"UPDATE dmphai " +
                        "SET " +
                        "ma='" + data.ma + "'" +
                        ",ten='" + data.ten + "'" +
                        ",ngayud=now() " +
                        "WHERE id =" + data.id;
                    irec = dbHelper.ExecuteQuery(sql, v_conn);
                    if (irec == 0)
                    {
                        sql = @"INSERT INTO dmkho(id,ma,ten) " +
                            "VALUES(" + data.id + ",'" + data.ma + "','" + data.ten + "') ";
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                    }
                    if (irec == 1)
                    {
                        return Get(v_conn, "\nWHERE a.id=" + data.id);
                    }
                    else
                    {
                        return null;
                    }

                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            public static bool Del(DelRecord data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Del(v_conn, data);
            }
            public static bool Del(string v_conn, DelRecord data)
            {
                try
                {
                    if (data.obj != null && data.obj != "")
                    {
                        var sql = "";
                        var irec = 0;
                        sql = "delete dmkho where id =" + data.key;
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                        if (irec == 1)
                            return true;
                        else
                            return false;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
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
            public string userid { get; set; }
            public static string Getid(string v_conn)
            {
                try
                {
                    string sql = "select case when max(id) is not null then max(id) + 1 else 1 end as id from dmkho";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["id"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static string Getma(string v_conn)
            {
                try
                {
                    string sql = "select 'KHO'||lpad(case when max(to_number(replace(ma,'KHO',''))) is not null then max(to_number(replace(ma,'KHO',''))) + 1 else 1 end,4,'0') as ma from dmkho";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["ma"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static IEnumerable<Khos> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Khos> Get(string v_conn, string v_where)
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
                    ds = dbHelper.getDataSetbySql(sql, v_conn);
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
            public static IEnumerable<Khos> Upd(Khos data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Upd(v_conn, data);
            }
            public static IEnumerable<Khos> Upd(string v_conn, Khos data)
            {
                try
                {
                    var sql = "";
                    var irec = 0;
                    if (data.id == null)
                    {
                        data.id = Getid(v_conn);
                    }
                    if (data.ghichu == "\n")
                    {
                        data.ghichu = "";
                    }
                    sql = @"UPDATE dmkho " +
                        "SET " +
                        "ma='" + data.ma + "'" +
                        ",ten='" + data.ten + "'" +
                        ",id_nhomkho=" + data.id_nhomkho +
                        ",ngayud=now() " +
                        "WHERE id =" + data.id;
                    irec = dbHelper.ExecuteQuery(sql, v_conn);
                    if (irec == 0)
                    {
                        sql = @"INSERT INTO dmkho(id,ma,ten,id_nhomkho) " +
                            "VALUES(" + data.id + ",'" + data.ma + "','" + data.ten + "'," + data.id_nhomkho + ") ";
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                    }
                    if (irec == 1)
                    {
                        return Get(v_conn, "\nWHERE a.id=" + data.id);
                    }
                    else
                    {
                        return null;
                    }

                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            public static bool Del(DelRecord data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Del(v_conn, data);
            }
            public static bool Del(string v_conn, DelRecord data)
            {
                try
                {
                    if (data.obj != null && data.obj != "")
                    {
                        var sql = "";
                        var irec = 0;
                        sql = "delete dmkho where id =" + data.key;
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                        if (irec == 1)
                            return true;
                        else
                            return false;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
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
            public static IEnumerable<Nhomkhos> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Nhomkhos> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Nhomkhos> lts = new List<Nhomkhos>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.stt,a.ten,a.userid "
                    + "\nFROM dmnhomkho a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
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
            public static string Getid(string v_conn)
            {
                try
                {
                    string sql = "select case when max(id) is not null then max(id) + 1 else 1 end as id from dmduoc";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["id"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static string Getma(string v_conn, string v_ten)
            {
                try
                {
                    string sql = "select '" + SHA1.Khongdau(v_ten).Replace(" ", "").ToUpper().Substring(0, 3) + "'||lpad(case when max(to_number(replace(ma,'" + SHA1.Khongdau(v_ten).Replace(" ", "").ToUpper().Substring(0, 3) + "',''))) is not null then max(to_number(replace(ma,'" + SHA1.Khongdau(v_ten).Replace(" ", "").ToUpper().Substring(0, 3) + "',''))) + 1 else 1 end,4,'0')  as ma from dmduoc where ma ilike '" + SHA1.Khongdau(v_ten).Replace(" ", "").ToUpper().Substring(0, 3) + "%'";
                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["ma"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static IEnumerable<Thuocs> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Thuocs> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Thuocs> lts = new List<Thuocs>();
                    string sql = "";
                    sql = @"SELECT a.id, a.stt, a.ma, a.ten, a.dang, a.hamluong, a.donvidg, a.donvisd, 
                    a.hoatchat, a.thanhphan, a.tyle1, a.tyle2, a.tinhtrang, a.atc, a.route, 
                    a.generic, a.userid, a.stt_40, a.sodk, 
                    to_char(a.ngay, 'dd/mm/yyyy hh24:mi') as ngay, to_char(a.ngayud, 'dd/mm/yyyy hh24:mi') as ngayud, a.idloaiduoc as id_loaiduoc, b.ten as ten_loaiduoc,
                    a.idhangsx as id_hangsx, c.ten as ten_hangsx, a.idquocgia as id_quocgia, d.ten as ten_quocgia, a.idduongdung as id_duongdung, e.ten as ten_duongdung
                    FROM dmduoc a
                    LEFT JOIN dmloaiduoc b ON b.id = a.idloaiduoc
                    LEFT JOIN dmhangsx@root c ON c.id = a.idhangsx
                    LEFT JOIN dmquocgia@root d ON d.id = a.idquocgia
                    LEFT JOIN dmduongdung@root e ON e.id = a.idduongdung " + v_where;
                    //"\nAND A.ID IN (4819,4817,4820,4434,4818,4154) LIMIT 500";
                    //+ "\nLIMIT 1500";
                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Thuocs item = new Thuocs();
                            item.id = dr["id"].ToString();
                            item.id_loaiduoc = dr["id_loaiduoc"].ToString();
                            item.stt = dr["stt"].ToString();
                            item.ma = dr["ma"].ToString();
                            item.ten = dr["ten"].ToString().Replace('"', '\'');
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
            public static IEnumerable<Thuocs> Upd(Thuocs data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Upd(v_conn, data);
            }
            public static IEnumerable<Thuocs> Upd(string v_conn, Thuocs data)
            {
                try
                {
                    var sql = "";
                    var irec = 0;
                    if (data.id == null)
                    {
                        data.id = Getid(v_conn);
                    }
                    if (data.thanhphan == null || data.thanhphan == "\n")
                    {
                        data.thanhphan = "";
                    }
                    if (data.hoatchat == null || data.hoatchat == "\n")
                    {
                        data.hoatchat = "";
                    }
                    if (data.ma == null || data.ma == "")
                    {
                        data.ma = Getma(v_conn, data.ten);
                    }
                    sql = @"UPDATE dmduoc " +
                        "SET " +
                        "ma='" + data.ma + "'" +
                        ",idloaiduoc=" + data.id_loaiduoc + "" +
                        ",ten='" + data.ten + "'" +
                        ",dang='" + (data.dang == null ? "" : data.dang) + "'" +
                        ",hamluong='" + (data.hamluong == null ? "" : data.hamluong) + "'" +
                        ",donvidg='" + (data.donvidg == null ? "" : data.donvidg) + "'" +
                        ",donvisd='" + (data.donvisd == null ? "" : data.donvisd) + "'" +
                        ",sodk='" + (data.sodk == null ? "" : data.sodk) + "'" +
                        ",atc='" + (data.atc == null ? "" : data.atc) + "'" +
                        ",idduongdung=" + (data.id_duongdung == null ? "0" : data.id_duongdung) + "" +
                        ",idhangsx=" + (data.id_hangsx == null ? "0" : data.id_hangsx) + "" +
                        ",idquocgia=" + (data.id_quocgia == null ? "0" : data.id_quocgia) + "" +
                        ",ngayud=now() " +
                        "WHERE id =" + data.id;
                    irec = dbHelper.ExecuteQuery(sql, v_conn);
                    if (irec == 0)
                    {
                        sql = @"INSERT INTO dmduoc(id,ma,ten,idloaiduoc,dang,hamluong,donvidg,donvisd,sodk,atc,idduongdung,idhangsx,idquocgia) " +
                            "VALUES(" + data.id + ",'" + data.ma + "','" + data.ten + "'," + data.id_loaiduoc + ",'" + (data.dang == null ? "" : data.dang) + "','" + (data.hamluong == null ? "" : data.hamluong) + "','" + (data.donvidg == null ? "" : data.donvidg) + "','" + (data.donvisd == null ? "" : data.donvisd) + "','" + (data.sodk == null ? "" : data.sodk) + "','" + (data.atc == null ? "" : data.atc) + "'," + (data.id_duongdung == null ? "0" : data.id_duongdung) + "," + (data.id_hangsx == null ? "0" : data.id_hangsx) + "," + (data.id_quocgia == null ? "0" : data.id_quocgia) + ") ";
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                    }
                    if (irec == 1)
                    {
                        return Get(v_conn, "\nWHERE a.id=" + data.id);
                    }
                    else
                    {
                        return null;
                    }

                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            public static bool Del(DelRecord data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Del(v_conn, data);
            }
            public static bool Del(string v_conn, DelRecord data)
            {
                try
                {
                    if (data.obj != null && data.obj != "")
                    {
                        var sql = "";
                        var irec = 0;
                        sql = "delete dmduoc where id =" + data.key;
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                        if (irec == 1)
                            return true;
                        else
                            return false;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }
        }
        public class Lydonxs
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Lydonxs> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Lydonxs> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Lydonxs> lts = new List<Lydonxs>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmlydonx a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Lydonxs item = new Lydonxs();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
        public class Duongdungs
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Duongdungs> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Duongdungs> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Duongdungs> lts = new List<Duongdungs>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmduongdung a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Duongdungs item = new Duongdungs();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
        public class Dangbds
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Dangbds> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Dangbds> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Dangbds> lts = new List<Dangbds>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmdangbd a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Dangbds item = new Dangbds();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
        public class Donvis
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Donvis> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Donvis> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Donvis> lts = new List<Donvis>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmdonvi a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Donvis item = new Donvis();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
        public class Loaiduocs
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Loaiduocs> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Loaiduocs> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Loaiduocs> lts = new List<Loaiduocs>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmloaiduoc a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Loaiduocs item = new Loaiduocs();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
        public class Hangsxs
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Hangsxs> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Hangsxs> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Hangsxs> lts = new List<Hangsxs>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmhangsx a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Hangsxs item = new Hangsxs();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
        public class Nhaccs
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Nhaccs> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Nhaccs> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Nhaccs> lts = new List<Nhaccs>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmnhacc a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Nhaccs item = new Nhaccs();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
        public class Dmhcs
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Dmhcs> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Dmhcs> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Dmhcs> lts = new List<Dmhcs>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmhc a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Dmhcs item = new Dmhcs();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
        public class Quocgias
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Quocgias> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Quocgias> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Quocgias> lts = new List<Quocgias>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmquocgia a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Quocgias item = new Quocgias();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
        public class Nhapkhocts
        {
            public string id { get; set; }
            public string idnhapkho { get; set; }
            public string idnguon { get; set; }
            public string tennguon { get; set; }
            public string idduoc { get; set; }
            public string tenduoc { get; set; }
            public string ma { get; set; }
            public string sodk { get; set; }
            public string hoatchat { get; set; }
            public string donvidg { get; set; }
            public string donvisd { get; set; }
            public string idhangsx { get; set; }
            public string tenhangsx { get; set; }
            public string mavach { get; set; }
            public string losx { get; set; }
            public string ngaysx { get; set; }
            public string handung { get; set; }
            public string baohanh { get; set; }
            public string vat { get; set; }
            public string chietkhau { get; set; }
            public string soluongdg { get; set; }
            public string soluongsd { get; set; }
            public string soluongn { get; set; }
            public string soluongx { get; set; }
            public string dongia { get; set; }
            public string dongiadg { get; set; }
            public string dongiavat { get; set; }
            public string dongiadgvat { get; set; }
            public string sotien { get; set; }
            public string sotiendg { get; set; }
            public string sotienvat { get; set; }
            public string sotiendgvat { get; set; }
            public string ghichu { get; set; }
            public string tinhtrang { get; set; }
            public string userid { get; set; }
            public string userten { get; set; }
            public string ngayud { get; set; }
            public string soluongyeucau { get; set; }
            public static IEnumerable<Nhapkhocts> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Nhapkhocts> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Nhapkhocts> lts = new List<Nhapkhocts>();
                    string sql = "";
                    sql = "SELECT a.id, a.idnhapkho, a.idnguon, c.ten as tennguon, a.idduoc, b.ten as tenduoc, b.ma, b.sodk, b.hoatchat, b.donvidg" +
                    "\n, case when b.donvisd = '' then b.dang else b.donvisd end as donvisd,b.idhangsx,e.ten as tenhangsx, a.mavach, a.losx, a.ngaysx, a.handung, a.baohanh, a.vat, a.chietkhau" +
                    "\n, a.soluongdg, a.soluongsd, a.soluongn, a.soluongx, a.dongia, a.dongiadg, a.dongiavat, a.dongiadgvat, a.sotien, a.sotiendg, a.sotiendg, a.sotienvat, a.sotiendgvat" +
                    "\n, a.ghichu, a.tinhtrang, a.userid, d.hoten as userten, a.ngayud, a.soluongyeucau" +
                    "\nFROM nhapkhoct a" +
                    "\nLEFT JOIN dmduoc b ON b.id = a.idduoc" +
                    "\nLEFT JOIN dmnguon@root c ON c.id = a.idnguon" +
                    "\nLEFT JOIN users@root d ON c.id = a.userid" +
                    "\nLEFT JOIN dmhangsx@root e ON e.id = b.idhangsx" +
                    v_where;
                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Nhapkhocts item = new Nhapkhocts();
                            item.id = dr["id"].ToString();
                            item.idnhapkho = dr["idnhapkho"].ToString();
                            item.idnguon = dr["idnguon"].ToString();
                            item.tennguon = dr["tennguon"].ToString();
                            item.idduoc = dr["idduoc"].ToString();
                            item.tenduoc = dr["tenduoc"].ToString();
                            item.ma = dr["ma"].ToString();
                            item.sodk = dr["sodk"].ToString();
                            item.hoatchat = dr["hoatchat"].ToString();
                            item.donvidg = dr["donvidg"].ToString();
                            item.donvisd = dr["donvisd"].ToString();
                            item.idhangsx = dr["idhangsx"].ToString();
                            item.tenhangsx = dr["tenhangsx"].ToString();
                            item.mavach = dr["mavach"].ToString();
                            item.losx = dr["losx"].ToString();
                            item.ngaysx = dr["ngaysx"].ToString();
                            item.handung = dr["handung"].ToString();
                            item.baohanh = dr["baohanh"].ToString();
                            item.vat = dr["vat"].ToString();
                            item.chietkhau = dr["chietkhau"].ToString();
                            item.soluongdg = dr["soluongdg"].ToString();
                            item.soluongsd = dr["soluongsd"].ToString();
                            item.soluongn = dr["soluongn"].ToString();
                            item.soluongx = dr["soluongx"].ToString();
                            item.dongia = dr["dongia"].ToString();
                            item.dongiadg = dr["dongiadg"].ToString();
                            item.dongiavat = dr["dongiavat"].ToString();
                            item.dongiadgvat = dr["dongiadgvat"].ToString();
                            item.sotien = dr["sotien"].ToString();
                            item.sotiendg = dr["sotiendg"].ToString();
                            item.sotienvat = dr["sotienvat"].ToString();
                            item.sotiendgvat = dr["sotiendgvat"].ToString();
                            item.ghichu = dr["ghichu"].ToString();
                            item.tinhtrang = dr["tinhtrang"].ToString();
                            item.userid = dr["userid"].ToString();
                            item.userten = dr["userten"].ToString();
                            item.ngayud = dr["ngayud"].ToString();
                            item.soluongyeucau = dr["soluongyeucau"].ToString();
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
            public static string Getid(string v_conn)
            {
                try
                {
                    string sql = "select to_char(now(),'yymmddhh24mi')||lpad(case when count(id) > 0 then to_char(max(to_number(right(id,5))) + 1) else '1' end ,5,'0') as id from nhapkhoct";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["id"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static IEnumerable<Nhapkhocts> Upd(NhapAlls data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Upd(v_conn, data);
            }
            public static IEnumerable<Nhapkhocts> Upd(string v_conn, NhapAlls data)
            {
                try
                {
                    var sql = "";
                    var irec = 0;
                    var v_id = "";
                    var v_dongiavat = "0";
                    var v_dongiadgvat = "0";
                    var v_sotien = "0";
                    var v_sotiendg = "0";
                    var v_sotienvat = "0";
                    var v_sotiendgvat = "0";
                    var v_idnguon = "0";
                    if (data.id != null && data.id != "")
                    {
                        v_id = data.id;
                    }
                    if (v_id == null || v_id == "")
                    {
                        v_id = Getid(v_conn);
                    }
                    //Kiem tra thuoc da nhap
                    DataSet ds = new DataSet();
                    ds = dbHelper.getDataSetbySql("select id from nhapkhoct where idnhapkho = " + data.idnhapkho + " and idduoc = " + data.idduoc + " and dongia = " + data.dongia + " and dongiadg =" + data.dongiadg, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        v_id = ds.Tables[0].Rows[0]["id"].ToString();
                    }
                    if (data.idnguon != null && data.idnguon != "")
                    {
                        v_idnguon = data.idnguon;
                    }
                    if (data.mavach == null || data.mavach == "")
                    {
                        data.mavach = "";
                    }
                    if (data.losx == null || data.losx == "")
                    {
                        data.losx = "";
                    }
                    if (data.ngaysx == null || data.ngaysx == "")
                    {
                        data.ngaysx = "";
                    }
                    if (data.handung == null || data.handung == "")
                    {
                        data.handung = "";
                    }
                    if (data.baohanh == null || data.baohanh == "")
                    {
                        data.baohanh = "0";
                    }
                    if (data.vat == null || data.vat == "")
                    {
                        data.vat = "0";
                    }
                    if (data.chietkhau == null || data.chietkhau == "")
                    {
                        data.chietkhau = "0";
                    }
                    if (data.vat == null || data.vat == "")
                    {
                        data.vat = "0";
                    }
                    if (data.soluongdg == null || data.soluongdg == "")
                    {
                        data.soluongdg = "0";
                    }
                    if (data.soluongsd == null || data.soluongsd == "")
                    {
                        data.soluongsd = "0";
                    }
                    if (data.soluongn == null || data.soluongn == "")
                    {
                        data.soluongn = "0";
                    }
                    if (data.dongiadg == null || data.dongiadg == "")
                    {
                        data.dongiadg = "0";
                    }
                    if (data.ghichu == null)
                    {
                        data.ghichu = "";
                    }
                    if (decimal.Parse(data.vat) != 0)
                    {
                        v_dongiavat = (decimal.Parse(data.dongia) + decimal.Parse(data.dongia) * (decimal.Parse(data.vat) / 100)).ToString();
                        if (data.dongiadg != "0")
                        {
                            v_dongiadgvat = (decimal.Parse(data.dongiadg) + decimal.Parse(data.dongiadg) * (decimal.Parse(data.vat) / 100)).ToString();
                        }
                    }
                    if (data.soluongn != "0")
                    {
                        v_sotien = (decimal.Parse(data.soluongn) * decimal.Parse(data.dongia)).ToString();
                        v_sotiendg = (decimal.Parse(data.soluongn) * decimal.Parse(data.dongiadg)).ToString();
                        v_sotienvat = (decimal.Parse(data.soluongn) * decimal.Parse(v_dongiavat)).ToString();
                        v_sotiendgvat = (decimal.Parse(data.soluongn) * decimal.Parse(v_dongiadgvat)).ToString();
                    }
                    sql = @"UPDATE nhapkhoct " +
                        "SET " +
                        "idnhapkho=" + data.idnhapkho + "" +
                        ",idduoc=" + data.idduoc + "" +
                        ",idnguon=" + decimal.Parse(v_idnguon) + "" +
                        ",mavach='" + data.mavach + "'" +
                        ",losx='" + data.losx + "'" +
                        ",ngaysx='" + data.ngaysx + "'" +
                        ",handung='" + data.handung + "'" +
                        ",baohanh=" + data.baohanh + "" +
                        ",vat=" + data.vat + "" +
                        ",chietkhau=" + data.chietkhau + "" +
                        ",soluongdg=to_number('" + data.soluongdg.Replace(',','.') + "')" +
                        ",soluongsd=to_number('" + data.soluongsd.Replace(',', '.') + "')" +
                        ",soluongn=to_number('" + data.soluongn.Replace(',', '.') + "')" +
                        ",dongia=to_number('" + data.dongia.Replace(',', '.') + "')" +
                        ",dongiadg=to_number('" + data.dongiadg.Replace(',', '.') + "')" +
                        ",dongiavat=to_number('" + v_dongiavat.Replace(',', '.') + "')" +
                        ",dongiadgvat=to_number('" + v_dongiadgvat.Replace(',', '.') + "')" +
                        ",sotien=to_number('" + v_sotien.Replace(',', '.') + "')" +
                        ",sotiendg=to_number('" + v_sotiendg.Replace(',', '.') + "')" +
                        ",sotienvat=to_number('" + v_sotienvat.Replace(',', '.') + "')" +
                        ",sotiendgvat=to_number('" + v_sotiendgvat.Replace(',', '.') + "')" +
                        ",ghichu='" + data.ghichu + "'" +
                        ",ngayud=now() " +
                        "WHERE id =" + v_id;
                    irec = dbHelper.ExecuteQuery(sql, v_conn);
                    if (irec == 0)
                    {
                        sql = @"INSERT INTO nhapkhoct(" +
                            "id, idnhapkho, idduoc, idnguon, mavach, losx, ngaysx, handung, baohanh, vat" +
                            ", chietkhau, soluongdg, soluongsd, soluongn, dongia, dongiadg, dongiavat, dongiadgvat, sotien, sotiendg" +
                            ", sotienvat, sotiendgvat, ghichu) " +
                            "VALUES(" +
                            v_id + "," + data.idnhapkho + "," + data.idduoc + "," + decimal.Parse(v_idnguon) + ",'" + data.mavach + "','" + data.losx + "','" + data.ngaysx + "','" + data.handung + "'," + decimal.Parse(data.baohanh) + "," + data.vat +
                            "," + data.chietkhau + ",to_number('" + data.soluongdg.Replace(',', '.') + "'),to_number('" + data.soluongsd.Replace(',', '.') + "'),to_number('" + data.soluongn.Replace(',', '.') + "'),to_number('" + data.dongia.Replace(',', '.') + "'),to_number('" + data.dongiadg.Replace(',', '.') + "'),to_number('" + v_dongiavat.Replace(',', '.') + "'),to_number('" + v_dongiadgvat.Replace(',', '.') + "'),to_number('" + v_sotien.Replace(',', '.') + "'),to_number('" + v_sotiendg.Replace(',', '.') + "'),to_number('" + v_sotienvat.Replace(',', '.') + "'),to_number('" + v_sotiendgvat.Replace(',', '.') + "'),'" + data.ghichu + "') ";
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                    }
                    if (irec == 1)
                    {
                        return Get(v_conn, "\nWHERE a.id=" + v_id);
                    }
                    else
                    {
                        return null;
                    }

                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            public static bool Del(DelRecord data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Del(v_conn, data);
            }
            public static bool Del(string v_conn, DelRecord data)
            {
                try
                {
                    if (data.obj != null && data.obj != "")
                    {
                        var sql = "";
                        var irec = 0;
                        //var idnhapkho = "";
                        //try
                        //{
                        //    if (data.key != null && data.key != "")
                        //    {
                        //        idnhapkho = dbHelper.getDataSetbySql("", v_conn).Tables[0].Rows[0]["idnguon"].ToString();
                        //    }
                        //}
                        //catch (Exception ex) { }
                        sql = "delete nhapkhoct where id =" + data.key;
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                        if (irec == 1)
                            return true;
                        else
                            return false;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }
            public static bool Kiemtraphieunhap(Check data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Kiemtraphieunhap(v_conn, data);
            }
            public static bool Kiemtraphieunhap(string v_conn, Check data)
            {
                try
                {
                    if (data.request.Split('~')[0] != "" && data.request.Split('~')[1] != "")
                    {
                        DataSet ds = new DataSet();
                        ds = dbHelper.getDataSetbySql("select id from nhapkhoct a where idnhapkho=" + data.request.Split('~')[0] + " and idduoc=" + data.request.Split('~')[1], v_conn);
                        if (ds != null && ds.Tables[0].Rows.Count > 0)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
        public class Nhapkhos
        {
            public string id { get; set; }
            public string idlydonx { get; set; }
            public string tenlydonx { get; set; }
            public string idnhacc { get; set; }
            public string tennhacc { get; set; }
            public string idkho { get; set; }
            public string tenkho { get; set; }
            public string ngay { get; set; }
            public string ngaytk { get; set; }
            public string ngayhd { get; set; }
            public string sohd { get; set; }
            public string ngaykk { get; set; }
            public string ngaynhan { get; set; }
            public string sophieu { get; set; }
            public string chietkhau { get; set; }
            public string chiphivc { get; set; }
            public string miengiam1 { get; set; }
            public string miengiam2 { get; set; }
            public string miengiam3 { get; set; }
            public string miengiam4 { get; set; }
            public string miengiam5 { get; set; }
            public string vat { get; set; }
            public string sotien { get; set; }
            public string sotiendg { get; set; }
            public string sotienhd { get; set; }
            public string nguoinhan { get; set; }
            public string nguoigiao { get; set; }
            public string noinhan { get; set; }
            public string ghichu { get; set; }
            public string tinhtrang { get; set; }
            public string userid { get; set; }
            public string userten { get; set; }
            public string ngayud { get; set; }
            public IEnumerable<Nhapkhocts> nhapkhocts { get; set; }
            public static IEnumerable<Nhapkhos> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Nhapkhos> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Nhapkhos> lts = new List<Nhapkhos>();
                    string sql = "";
                    sql = @"SELECT a.id, a.idlydonx, b.ten as tenlydonx, a.idnhacc, c.ten as tennhacc, a.idkho, d.ten as tenkho, to_char(a.ngay,'dd/mm/yyyy') as ngay " +
                    "\n, to_char(a.ngaytk,'dd/mm/yyyy') as ngaytk, a.ngayhd, a.sohd, a.ngaykk, ngaynhan, a.sophieu, a.chietkhau, a.chiphivc, a.miengiam1, a.miengiam2, miengiam3 " +
                    "\n, a.miengiam4, a.miengiam5, a.vat, a.sotien, a.sotiendg, a.sotienhd, a.nguoinhan, nguoigiao, a.noinhan, a.ghichu, a.tinhtrang, a.userid, e.hoten as userten, to_char(a.ngayud,'dd/mm/yyyy hh24:mi') as ngayud " +
                    "\nFROM nhapkho a " +
                    "\nLEFT JOIN dmlydonx@root b ON b.id = a.idlydonx " +
                    "\nLEFT JOIN dmnhacc@root c ON c.id = a.idnhacc " +
                    "\nLEFT JOIN dmkho d ON d.id = a.idkho " +
                    "\nLEFT JOIN users@root e ON e.id = a.userid "
                    + v_where;

                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Nhapkhos item = new Nhapkhos();
                            item.id = dr["id"].ToString();
                            item.idlydonx = dr["idlydonx"].ToString();
                            item.tenlydonx = dr["tenlydonx"].ToString();
                            item.idnhacc = dr["idnhacc"].ToString();
                            item.tennhacc = dr["tennhacc"].ToString();
                            item.idkho = dr["idkho"].ToString();
                            item.tenkho = dr["tenkho"].ToString();
                            item.ngay = dr["ngay"].ToString();
                            item.ngaytk = dr["ngaytk"].ToString();
                            item.ngayhd = dr["ngayhd"].ToString();
                            item.sohd = dr["sohd"].ToString();
                            item.ngaykk = dr["ngaykk"].ToString();
                            item.ngaynhan = dr["ngaynhan"].ToString();
                            item.sophieu = dr["sophieu"].ToString();
                            item.chietkhau = dr["chietkhau"].ToString();
                            item.chiphivc = dr["chiphivc"].ToString();
                            item.miengiam1 = dr["miengiam1"].ToString();
                            item.miengiam2 = dr["miengiam2"].ToString();
                            item.miengiam3 = dr["miengiam3"].ToString();
                            item.miengiam4 = dr["miengiam4"].ToString();
                            item.miengiam5 = dr["miengiam5"].ToString();
                            item.vat = dr["vat"].ToString();
                            item.sotien = dr["sotien"].ToString();
                            item.sotiendg = dr["sotiendg"].ToString();
                            item.sotienhd = dr["sotienhd"].ToString();
                            item.nguoinhan = dr["nguoinhan"].ToString();
                            item.nguoigiao = dr["nguoigiao"].ToString();
                            item.noinhan = dr["noinhan"].ToString();
                            item.ghichu = dr["ghichu"].ToString();
                            item.tinhtrang = dr["tinhtrang"].ToString();
                            item.userid = dr["userid"].ToString();
                            item.userid = dr["userten"].ToString();
                            item.userid = dr["ngayud"].ToString();
                            item.nhapkhocts = Nhapkhocts.Get(v_conn, "\nWHERE idnhapkho =" + dr["id"].ToString());
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
            public static string Getid(string v_conn)
            {
                try
                {
                    string sql = "select to_char(now(),'yymmddhh24mi')||lpad(case when count(id) > 0 then to_char(max(to_number(right(id,5))) + 1) else '1' end ,5,'0') as id from nhapkho";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["id"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static IEnumerable<Nhapkhos> Upd(NhapAlls data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Upd(v_conn, data);
            }
            public static IEnumerable<Nhapkhos> Upd(string v_conn, NhapAlls data)
            {
                try
                {
                    var sql = "";
                    var irec = 0;
                    if (data.idnhapkho == null)
                    {
                        data.idnhapkho = Getid(v_conn);
                    }

                    sql = @"UPDATE nhapkho " +
                        "SET " +
                        //"id=" + data.idnhapkho + "" +
                        "idlydonx=" + data.idlydonx + "" +
                        ",idnhacc=" + data.idnhacc + "" +
                        ",idkho=" + data.idkho + "" +
                        ",ngay='" + (data.ngay == null ? "now()" : "to_date('" + data.ngay + "','dd/mm/yyyy')") + "'" +
                        ",ngaytk='" + (data.ngaytk == null ? "now()" : "to_date('" + data.ngaytk + "','dd/mm/yyyy')") + "'" +
                        ",ngayhd='" + (data.ngayhd == null ? "" : data.ngayhd) + "'" +
                        ",sohd='" + (data.sohd == null ? "" : data.sohd) + "'" +
                        ",ngaykk='" + (data.ngaykk == null ? "" : data.ngaykk) + "'" +
                        ",ngaynhan='" + (data.ngaynhan == null ? "" : data.ngaynhan) + "'" +
                        ",sophieu='" + (data.sophieu == null ? "0" : data.sophieu) + "'" +
                        ",chietkhau=" + (data.chietkhau == null ? "0" : data.chietkhau) + "" +
                        ",chiphivc=" + (data.chiphivc == null ? "0" : data.chiphivc) + "" +
                        ",vat=" + (data.vat == null ? "0" : data.vat) + "" +
                        ",nguoinhan='" + (data.nguoinhan == null ? "" : data.nguoinhan) + "'" +
                        ",nguoigiao='" + (data.nguoigiao == null ? "" : data.nguoigiao) + "'" +
                        ",sotienhd=to_number('" + (data.sotienhd == null ? "0" : data.sotienhd) + "')" +
                        ",ngayud=now() " +
                        "WHERE id =" + data.idnhapkho;
                    irec = dbHelper.ExecuteQuery(sql, v_conn);
                    if (irec == 0)
                    {
                        sql = @"INSERT INTO nhapkho(id, idlydonx, idnhacc, idkho, ngay, ngaytk, ngayhd, sohd, ngaykk, ngaynhan, sophieu, chietkhau, chiphivc" +
                            ", vat, nguoinhan, nguoigiao, sotienhd) " +
                            "VALUES(" + data.idnhapkho + "," + data.idlydonx + "," + data.idnhacc + "," + data.idkho + "," + (data.ngay == null ? "now()" : "to_date('" + data.ngay + "','dd/mm/yyyy')") + "," + (data.ngaytk == null ? "now()" : "to_date('" + data.ngaytk + "','dd/mm/yyyy')") + "" +
                            ",'" + data.ngayhd + "','" + data.sohd + "','" + data.ngaykk + "','" + data.ngaynhan + "','" + data.sophieu + "'," + data.chietkhau + "," + (data.chiphivc == null ? 0 : decimal.Parse(data.chiphivc)) + "" +
                            "," + data.vat + ",'" + data.nguoinhan + "','" + data.nguoigiao + "', " + (data.sotienhd == null ? "0" : data.sotienhd) + ") ";
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                    }
                    if (irec == 1)
                    {
                        IEnumerable<Nhapkhocts> lts = Nhapkhocts.Upd(v_conn, data);
                        if (lts != null && lts.Count() > 0)
                        {
                            sql = "update nhapkho a set a.sotien = b.sotien, a.sotiendg = b.sotiendg" +
                            "\nfrom (select idnhapkho, sum(sotien) as sotien, sum(sotiendg) as sotiendg from nhapkhoct where idnhapkho =" + data.idnhapkho + " group by idnhapkho) b " +
                            "\nwhere a.id =b.idnhapkho";
                            irec = dbHelper.ExecuteQuery(sql, v_conn);
                        }
                        return Get(v_conn, "\nWHERE a.id=" + data.idnhapkho);
                    }
                    else
                    {
                        return null;
                    }

                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            public static bool Del(DelRecord data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Del(v_conn, data);
            }
            public static bool Del(string v_conn, DelRecord data)
            {
                try
                {
                    if (data.obj != null && data.obj != "")
                    {
                        var sql = "";
                        var irec = 0;
                        sql = "delete nhapkhoct where idnhapkho =" + data.key;
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                        sql = "delete nhapkho where id =" + data.key;
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                        if (irec == 1)
                            return true;
                        else
                            return false;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }
        }
        public class NhapAlls
        {
            public string id { get; set; }
            public string idnhapkho { get; set; }
            public string idlydonx { get; set; }
            public string idnhacc { get; set; }
            public string idkho { get; set; }
            public string ngay { get; set; }
            public string ngaytk { get; set; }
            public string ngayhd { get; set; }
            public string sohd { get; set; }
            public string ngaykk { get; set; }
            public string ngaynhan { get; set; }
            public string sophieu { get; set; }
            public string chietkhau { get; set; }
            public string chiphivc { get; set; }
            public string miengiam1 { get; set; }
            public string miengiam2 { get; set; }
            public string miengiam3 { get; set; }
            public string miengiam4 { get; set; }
            public string miengiam5 { get; set; }
            public string nguoinhan { get; set; }
            public string nguoigiao { get; set; }
            public string noinhan { get; set; }
            public string ghichu { get; set; }
            public string tinhtrang { get; set; }
            public string userid { get; set; }
            public string idduoc { get; set; }
            public string idnguon { get; set; }
            public string mavach { get; set; }
            public string losx { get; set; }
            public string ngaysx { get; set; }
            public string handung { get; set; }
            public string baohanh { get; set; }
            public string vat { get; set; }
            public string soluongdg { get; set; }
            public string soluongsd { get; set; }
            public string soluongn { get; set; }
            public string soluongx { get; set; }
            public string dongia { get; set; }
            public string dongiadg { get; set; }
            public string sotienhd { get; set; }
            public static IEnumerable<Nhapkhos> Upd(NhapAlls data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Upd(v_conn, data);
            }
            public static IEnumerable<Nhapkhos> Upd(string v_conn, NhapAlls data)
            {
                try
                {
                    return Nhapkhos.Upd(data);
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        #region Nhân sự
        public class Phongbans
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public string ghichu { get; set; }
            public string userid { get; set; }
            public static string Getid(string v_conn)
            {
                try
                {
                    string sql = "select case when max(id) is not null then max(id) + 1 else 1 end as id from dmphongban";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["id"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static string Getma(string v_conn)
            {
                try
                {
                    string sql = "select 'PHB'||lpad(case when max(to_number(replace(ma,'PHB',''))) is not null then max(to_number(replace(ma,'PHB',''))) + 1 else 1 end,4,'0') as ma from dmphongban";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["ma"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static IEnumerable<Phongbans> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Phongbans> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Phongbans> lts = new List<Phongbans>();
                    string sql = "";
                    sql = "SELECT a.id, a.ma, a.ten, a.ghichu"
                    + "\nFROM dmphongban a"
                    + v_where;
                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Phongbans item = new Phongbans();
                            item.id = dr["id"].ToString();
                            item.ma = dr["ma"].ToString();
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
            public static IEnumerable<Phongbans> Upd(Phongbans data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Upd(v_conn, data);
            }
            public static IEnumerable<Phongbans> Upd(string v_conn, Phongbans data)
            {
                try
                {
                    var sql = "";
                    var irec = 0;
                    if (data.ghichu == "\n")
                    {
                        data.ghichu = "";
                    }
                    if (data.id == null || data.id == "")
                    {
                        data.id = Getid(v_conn);
                    }
                    if (data.ma == null || data.ma == "")
                    {
                        data.ma = Getma(v_conn);
                    }
                    sql = @"UPDATE dmphongban " +
                        "SET " +
                        "ma='" + data.ma + "'" +
                        ",ten='" + data.ten + "'" +
                        ",ghichu='" + data.ghichu + "'" +
                        ",ngayud=now() " +
                        "WHERE id =" + data.id;
                    irec = dbHelper.ExecuteQuery(sql, v_conn);
                    if (irec == 0)
                    {
                        sql = @"INSERT INTO dmphongban(id, ma, ten, ghichu) " +
                            "VALUES(" + data.id + ",'" + data.ma + "','" + data.ten + "','" + data.ghichu + "') ";
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                    }
                    if (irec == 1)
                    {
                        return Get(v_conn, "\nWHERE a.ma='" + data.ma + "'");
                    }
                    else
                    {
                        return null;
                    }

                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            public static bool Del(DelRecord data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Del(v_conn, data);
            }
            public static bool Del(string v_conn, DelRecord data)
            {
                try
                {
                    if (data.obj != null && data.obj != "")
                    {
                        var sql = "";
                        var irec = 0;
                        sql = "delete dmphongban where id =" + data.key;
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                        if (irec == 1)
                            return true;
                        else
                            return false;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }
        }
        public class Nhanviens
        {
            public string id { get; set; }
            public string hoten { get; set; }
            public string ngaysinh { get; set; }
            public string namsinh { get; set; }
            public string diachi { get; set; }
            public string sdt { get; set; }
            public string email { get; set; }
            public string capbac { get; set; }
            public string mucluong { get; set; }
            public string idphai { get; set; }
            public string tenphai { get; set; }
            public string idphongban { get; set; }
            public string tenphongban { get; set; }
            public string userid { get; set; }
            public static string Getid(string v_conn)
            {
                try
                {
                    string sql = "select to_char(now(),'yymmddhh24mi')||lpad(case when count(id) > 0 then to_char(max(to_number(right(id,5))) + 1) else '1' end ,5,'0') as id from nhanvien";

                    return dbHelper.getDataSetbySql(sql, v_conn) != null && dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql, v_conn).Tables[0].Rows[0]["id"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static IEnumerable<Nhanviens> Get(string v_where)
            {
                return Get("", v_where);
            }
            public static IEnumerable<Nhanviens> Get(string v_conn, string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Nhanviens> lts = new List<Nhanviens>();
                    string sql = "";
                    sql = "SELECT a.id, a.hoten, a.ngaysinh, a.namsinh, a.idphai, b.ten as tenphai, a.diachi"
                    + "\n, a.sdt, a.email, a.idphongban, c.ten as tenphongban, a.capbac, case when length(a.mucluong)> 6 then to_char(to_number(a.mucluong),'999,999,999,999,999,999.00') else a.mucluong end as mucluong"
                    + "\nFROM nhanvien a"
                    + "\nLEFT JOIN dmphai b on b.id = a.idphai"
                    + "\nLEFT JOIN dmphongban c on c.id = a.idphongban"
                    + v_where;
                    ds = dbHelper.getDataSetbySql(sql, v_conn);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Nhanviens item = new Nhanviens();
                            item.id = dr["id"].ToString();
                            item.hoten = dr["hoten"].ToString();
                            item.ngaysinh = dr["ngaysinh"].ToString();
                            item.namsinh = dr["namsinh"].ToString();
                            item.diachi = dr["diachi"].ToString();
                            item.sdt = dr["sdt"].ToString();
                            item.email = dr["email"].ToString();
                            item.capbac = dr["capbac"].ToString();
                            item.mucluong = dr["mucluong"].ToString();
                            item.idphai = dr["idphai"].ToString();
                            item.tenphai = dr["tenphai"].ToString();
                            item.idphongban = dr["idphongban"].ToString();
                            item.tenphongban = dr["tenphongban"].ToString();
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
            public static IEnumerable<Nhanviens> Upd(Nhanviens data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Upd(v_conn, data);
            }
            public static IEnumerable<Nhanviens> Upd(string v_conn, Nhanviens data)
            {
                try
                {
                    var sql = "";
                    var irec = 0;
                    if (data.id == null || data.id == "")
                    {
                        data.id = Getid(v_conn);
                    }
                    sql = @"UPDATE nhanvien " +
                        "SET " +
                        "hoten='" + data.hoten + "'" +
                        ",ngaysinh='" + data.ngaysinh + "'" +
                        ",namsinh='" + data.namsinh + "'" +
                        ",diachi='" + data.diachi + "'" +
                        ",sdt='" + data.sdt + "'" +
                        ",email='" + data.email + "'" +
                        ",capbac='" + data.capbac + "'" +
                        ",mucluong='" + data.mucluong + "'" +
                        ",idphai=" + data.idphai +
                        ",idphongban=" + data.idphongban +
                        ",ngayud=now() " +
                        "WHERE id =" + data.id;
                    irec = dbHelper.ExecuteQuery(sql, v_conn);
                    if (irec == 0)
                    {
                        sql = @"INSERT INTO nhanvien(id, hoten, ngaysinh, namsinh,diachi,sdt,email,capbac, mucluong,idphai,idphongban) " +
                            "VALUES(" + data.id + ",'" + data.hoten + "','" + data.ngaysinh + "','" + data.namsinh + "','" + data.diachi + "','" + data.sdt + "','" + data.email + "','" + data.capbac + "','" + data.mucluong + "'," + data.idphai + "," + data.idphongban + ") ";
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                    }
                    if (irec == 1)
                    {
                        return Get(v_conn, "\nWHERE a.id=" + data.id);
                    }
                    else
                    {
                        return null;
                    }

                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            public static bool Del(DelRecord data)
            {
                string v_conn = "";
                if (data.userid != null)
                {
                    v_conn = ConnectionString.Replace("null", data.userid.Substring(0, 10));
                }
                return Del(v_conn, data);
            }
            public static bool Del(string v_conn, DelRecord data)
            {
                try
                {
                    if (data.obj != null && data.obj != "")
                    {
                        var sql = "";
                        var irec = 0;
                        sql = "delete nhanvien where id =" + data.key;
                        irec = dbHelper.ExecuteQuery(sql, v_conn);
                        if (irec == 1)
                            return true;
                        else
                            return false;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                }
            }
        }
        #endregion
    }
}