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
                                sqlwhere += "\nWHERE a." + item + "";
                            }
                            else
                            {
                                sqlwhere += "||a." + item + "";
                            }
                        }
                        sqlwhere += " ILIKE '%" + search.val + "%'";
                        sqlwhere += "\nLIMIT 50";
                    }
                    switch (search.obj)
                    {
                        case "nhomkhos":
                            return Nhomkhos.GetAll(sqlwhere);
                        case "khos":
                            return Khos.GetAll(sqlwhere);
                        case "lydonxs":
                            return Lydonxs.GetAll(sqlwhere);
                        case "nhanviens":
                            return Users.GetAll(sqlwhere);
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

        public class CreateVal
        {
            public string obj { get; set; }
            public string val { get; set; }
            public string result { get; set; }
        }

        public class Del
        {
            public string obj { get; set; }
            public string key { get; set; }
            public bool result { get; set; }
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
                    sql = "SELECT a.id, a.username_, a.password_, a.hoten, a.ngaysinh, a.diachi, a.sdt, a.email, a.ngay, a.ngayud, a.loaiuser " +
                    "\nFROM users a" + v_where;
                    ds = dbHelper.getDataSetbySql(sql);
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

        public class Khos
        {
            public string id { get; set; }
            public string id_nhomkho { get; set; }
            public string nhomkho { get; set; }
            public string ma { get; set; }
            public string stt { get; set; }
            public string ten { get; set; }
            public string ghichu { get; set; }
            public static string Getid()
            {
                try
                {
                    string sql = "select case when max(id) is not null then max(id) + 1 else 1 end as id from dmkho";

                    return dbHelper.getDataSetbySql(sql) != null && dbHelper.getDataSetbySql(sql).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql).Tables[0].Rows[0]["id"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
            public static string Getma()
            {
                try
                {
                    string sql = "select 'KHO'||lpad(case when max(to_number(replace(ma,'KHO',''))) is not null then max(to_number(replace(ma,'KHO',''))) + 1 else 1 end,4,'0') as ma from dmkho";

                    return dbHelper.getDataSetbySql(sql) != null && dbHelper.getDataSetbySql(sql).Tables[0].Rows.Count > 0 ? dbHelper.getDataSetbySql(sql).Tables[0].Rows[0]["ma"].ToString() : "";
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
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
            public static IEnumerable<Khos> Upd(Khos data)
            {
                try
                {
                    var sql = "";
                    var irec = 0;
                    if (data.id == null)
                    {
                        data.id = Getid();
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
                    irec = dbHelper.ExecuteQuery(sql);
                    if (irec == 0)
                    {
                        sql = @"INSERT INTO dmkho(id,ma,ten,id_nhomkho) " +
                            "VALUES(" + data.id + ",'" + data.ma + "','" + data.ten + "'," + data.id_nhomkho + ") ";
                        irec = dbHelper.ExecuteQuery(sql);
                    }
                    if (irec == 1)
                    {
                        return GetAll("\nWHERE a.id=" + data.id);
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
            public static bool Del(Del data)
            {
                try
                {
                    if (data.obj != null && data.obj != "")
                    {
                        var sql = "";
                        var irec = 0;
                        sql = "delete dmkho where id =" + data.key;
                        irec = dbHelper.ExecuteQuery(sql);
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
                    sql = "SELECT a.id,a.ma,a.stt,a.ten,a.userid "
                    + "\nFROM dmnhomkho a" + v_where;
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
        }

        public class Lydonxs
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Lydonxs> GetAll()
            {
                return GetAll("\nWHERE 1=1");
            }
            public static IEnumerable<Lydonxs> GetAll(string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Lydonxs> lts = new List<Lydonxs>();
                    string sql = "";
                    sql = "SELECT a.id,a.ma,a.ten "
                    + "\nFROM dmlydonx a" + v_where;
                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql);
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

        public class Nhapkhocts
        {
            public string id { get; set; }
            public string idnhapkho { get; set; }
            public string idduoc { get; set; }
            public string tenduoc { get; set; }
            public string idnguon { get; set; }
            public string tennguon { get; set; }
            public string mavach { get; set; }
            public string losx { get; set; }
            public string ngaysx { get; set; }
            public string handung { get; set; }
            public string baohanh { get; set; }
            public string numeric { get; set; }
            public string vat { get; set; }
            public string chietkhau { get; set; }
            public string soluongdg { get; set; }
            public string soluongsd { get; set; }
            public string soluongn { get; set; }
            public string soluongx { get; set; }
            public string dongia { get; set; }
            public string dongiavat { get; set; }
            public string sotien { get; set; }
            public string sotienvat { get; set; }
            public string ghichu { get; set; }
            public string tinhtrang { get; set; }
            public string userid { get; set; }
            public string userten { get; set; }
            public string ngayud { get; set; }
            public string soluongyeucau { get; set; }
            public static IEnumerable<Nhapkhocts> GetAll()
            {
                return GetAll("\nWHERE 1=1");
            }
            public static IEnumerable<Nhapkhocts> GetAll(string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Nhapkhocts> lts = new List<Nhapkhocts>();
                    string sql = "";
                    sql = "SELECT a.id, a.idnhapkho, a.idduoc, b.ten as tenduoc, a.idnguon, c.ten as tennguon, a.mavach, a.losx, a.ngaysx, a.handung, a.baohanh, a.vat, a.chietkhau" +
                    "\n, a.soluongdg, a.soluongsd, a.soluongn, a.soluongx, a.dongia, a.dongiavat, a.sotien, a.sotienvat, a.ghichu, a.tinhtrang, a.userid, d.hoten as userten, a.ngayud, a.soluongyeucau" +
                    "\nFROM nhapkhoct a" +
                    "\nLEFT JOIN dmduoc b ON b.id = a.idduoc" +
                    "\nLEFT JOIN dmnguon c ON c.id = a.idnguon" +
                    "\nLEFT JOIN users d ON c.id = a.userid"
                    + v_where;
                    ds = dbHelper.getDataSetbySql(sql);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Nhapkhocts item = new Nhapkhocts();
                            item.id = dr["id"].ToString();
                            item.idnhapkho = dr["idnhapkho"].ToString();
                            item.idduoc = dr["idduoc"].ToString();
                            item.tenduoc = dr["tenduoc"].ToString();
                            item.idnguon = dr["idnguon"].ToString();
                            item.tennguon = dr["tennguon"].ToString();
                            item.mavach = dr["mavach"].ToString();
                            item.losx = dr["losx"].ToString();
                            item.ngaysx = dr["ngaysx"].ToString();
                            item.handung = dr["handung"].ToString();
                            item.baohanh = dr["baohanh"].ToString();
                            item.numeric = dr["numeric"].ToString();
                            item.vat = dr["vat"].ToString();
                            item.chietkhau = dr["chietkhau"].ToString();
                            item.soluongdg = dr["soluongdg"].ToString();
                            item.soluongsd = dr["soluongsd"].ToString();
                            item.soluongn = dr["soluongn"].ToString();
                            item.soluongx = dr["soluongx"].ToString();
                            item.dongia = dr["dongia"].ToString();
                            item.dongiavat = dr["dongiavat"].ToString();
                            item.sotien = dr["sotien"].ToString();
                            item.sotienvat = dr["sotienvat"].ToString();
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

            public static IEnumerable<Nhapkhos> GetAll()
            {
                return GetAll("\nWHERE 1=1");
            }
            public static IEnumerable<Nhapkhos> GetAll(string v_where)
            {
                try
                {
                    DataSet ds = new DataSet();
                    List<Nhapkhos> lts = new List<Nhapkhos>();
                    string sql = "";
                    sql = @"SELECT a.id, a.idlydonx, b.ten as tenlydonx, a.idnhacc, c.ten as tennhacc, a.idkho, d.ten as tenkho, to_char(a.ngay,'dd/mm/yyyy') as ngay " +
                    "\n, to_char(a.ngaytk,'dd/mm/yyyy') as ngaytk, a.ngayhd, a.ngaykk, ngaynhan, a.sophieu, a.chietkhau, a.chiphivc, a.miengiam1, a.miengiam2, miengiam3 " +
                    "\n, a.miengiam4, a.miengiam5, a.vat, a.sotien, a.sotienhd, a.nguoinhan, nguoigiao, a.noinhan, a.ghichu, a.tinhtrang, a.userid, e.hoten as userten, to_char(a.ngayud,'dd/mm/yyyy hh24:mi') as ngayud " +
                    "\nFROM nhapkho a " +
                    "\nLEFT JOIN dmlydonx b ON b.id = a.idlydonx " +
                    "\nLEFT JOIN dmnhacc c ON c.id = a.idnhacc " +
                    "\nLEFT JOIN dmkho d ON d.id = a.idkho " +
                    "\nLEFT JOIN users e ON e.id = a.userid "
                    + v_where;

                    //+ "\nLIMIT 50";

                    ds = dbHelper.getDataSetbySql(sql);
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
                            item.sotienhd = dr["sotienhd"].ToString();
                            item.nguoinhan = dr["nguoinhan"].ToString();
                            item.nguoigiao = dr["nguoigiao"].ToString();
                            item.noinhan = dr["noinhan"].ToString();
                            item.ghichu = dr["ghichu"].ToString();
                            item.tinhtrang = dr["tinhtrang"].ToString();
                            item.userid = dr["userid"].ToString();
                            item.userid = dr["userten"].ToString();
                            item.userid = dr["ngayud"].ToString();
                            item.nhapkhocts = Nhapkhocts.GetAll("\nWHERE idnhapkho =" + dr["id"].ToString());
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