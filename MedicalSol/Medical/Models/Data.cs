using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Medical.Models
{
    public class Data
    {
        private static string DefaultUrl = "http://localhost:48187/";
        #region Class Dung Chung
        public class User
        {
            [Display(Name = "Id")]
            public string iduser { get; set; }

            [Display(Name = "Họ tên")]
            public string hoten { get; set; }

            [Display(Name = "Ngày sinh")]
            public string ngaysinh { get; set; }

            [Display(Name = "Email")]
            public string email { get; set; }

            [Display(Name = "Địa chỉ")]
            public string diachi { get; set; }

            public User(Object obj)
            {
                try
                {
                    var value = Bridge.HttpPostApi("logins", obj);
                    var json = DataProcess.ConvertJsonStringToJsonObject(value);
                    if (json != null)
                    {
                        iduser = json["iduser"].ToString();
                        hoten = json["hoten"].ToString();
                        ngaysinh = json["ngaysinh"].ToString();
                        email = json["email"].ToString();
                        diachi = json["diachi"].ToString();
                    }
                }
                catch (Exception ex)
                {
                }
            }

            public class Login
            {
                [Required]
                [Display(Name = "Tên đăng nhập")]
                public string username_ { get; set; }

                [Required]
                [DataType(DataType.Password)]
                [Display(Name = "Password")]
                public string password_ { get; set; }

                [Display(Name = "Nhớ mật khẩu")]
                public bool rememberme { get; set; }

                public bool IsValid(Object obj)//string _username, string _password
                {
                    try
                    {
                        var value = Bridge.HttpPostApi("logins", obj);//_username, _password
                        var json = DataProcess.ConvertJsonStringToJsonObject(value);
                        if (json != null)
                        {
                            return true;
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

            public class Register
            {

            }
        }
        public class AjaxData
        {
            public string Name { get; set; }
            public Object Rows { get; set; }
            public AjaxData()
            {
                this.Name = "Table";
                this.Rows = null;
            }
            public AjaxData(Object jarr)
            {
                this.Name = "Table";
                this.Rows = jarr;
            }
        }
        public class Filter
        {
            public string Obj { get; set; }
            public string Col { get; set; }
            public string Val { get; set; }
        }
        public class CreateVal
        {
            public string Obj { get; set; }
            public string Val { get; set; }
        }
        public class Save
        {
            public string Obj { get; set; }
            public Object val { get; set; }
        }
        public class Del
        {
            public string obj { get; set; }
            public string key { get; set; }
            public string result { get; set; }
        }
        public class Table
        {
            public string Obj { get; set; }
        }
        public class Lydonx
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static string GetAll()
            {
                try
                {
                    var value = Bridge.HttpGetApi("lydonxs");
                    return value;
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            public static IEnumerable<Lydonx> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("lydonxs"));
            }
            public static IEnumerable<Lydonx> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("lydonxs");
                    List<Lydonx> dslydo = new List<Lydonx>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Lydonx lydo = new Lydonx();
                        lydo.id = item.id;
                        lydo.ma = item.ma;
                        lydo.ten = item.ten;
                        dslydo.Add(lydo);
                    }
                    return dslydo;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class Duongdung
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Duongdung> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("lydonxs"));
            }
            public static IEnumerable<Duongdung> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("lydonxs");
                    List<Duongdung> lts = new List<Duongdung>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Duongdung lydo = new Duongdung();
                        lydo.id = item.id;
                        lydo.ma = item.ma;
                        lydo.ten = item.ten;
                        lts.Add(lydo);
                    }
                    return lts;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class Dangbd
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Dangbd> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("dangbds"));
            }
            public static IEnumerable<Dangbd> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("lydonxs");
                    List<Dangbd> lts = new List<Dangbd>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Dangbd lydo = new Dangbd();
                        lydo.id = item.id;
                        lydo.ma = item.ma;
                        lydo.ten = item.ten;
                        lts.Add(lydo);
                    }
                    return lts;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class Donvi
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Donvi> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("dmdonvis"));
            }
            public static IEnumerable<Donvi> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("lydonxs");
                    List<Donvi> lts = new List<Donvi>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Donvi lydo = new Donvi();
                        lydo.id = item.id;
                        lydo.ma = item.ma;
                        lydo.ten = item.ten;
                        lts.Add(lydo);
                    }
                    return lts;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class Loaiduoc
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Loaiduoc> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("loaiduocs"));
            }
            public static IEnumerable<Loaiduoc> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("lydonxs");
                    List<Loaiduoc> lts = new List<Loaiduoc>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Loaiduoc lydo = new Loaiduoc();
                        lydo.id = item.id;
                        lydo.ma = item.ma;
                        lydo.ten = item.ten;
                        lts.Add(lydo);
                    }
                    return lts;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class Hangsx
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Hangsx> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("hangsxs"));
            }
            public static IEnumerable<Hangsx> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("lydonxs");
                    List<Hangsx> lts = new List<Hangsx>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Hangsx lydo = new Hangsx();
                        lydo.id = item.id;
                        lydo.ma = item.ma;
                        lydo.ten = item.ten;
                        lts.Add(lydo);
                    }
                    return lts;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class Quocgia
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static IEnumerable<Quocgia> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("quocgias"));
            }
            public static IEnumerable<Quocgia> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("lydonxs");
                    List<Quocgia> lts = new List<Quocgia>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Quocgia lydo = new Quocgia();
                        lydo.id = item.id;
                        lydo.ma = item.ma;
                        lydo.ten = item.ten;
                        lts.Add(lydo);
                    }
                    return lts;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class Nhanvien
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
            public static string GetAll()
            {
                try
                {
                    var value = Bridge.HttpGetApi("lydonxs");
                    return value;
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            public static IEnumerable<Nhanvien> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("nhanviens"));
            }
            public static IEnumerable<Nhanvien> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("nhanviens");
                    List<Nhanvien> ds = new List<Nhanvien>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Nhanvien obj = new Nhanvien();
                        obj.iduser = item.iduser;
                        obj.hoten = item.hoten;
                        ds.Add(obj);
                    }
                    return ds;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        #endregion
        #region Class Duoc
        public class Kho
        {
            public string id { get; set; }
            public string id_nhomkho { get; set; }
            public string nhomkho { get; set; }
            public string ma { get; set; }
            public string stt { get; set; }
            public string ten { get; set; }
            public string ghichu { get; set; }
            public static string GetAll()
            {
                try
                {
                    var value = Bridge.HttpGetApi("khos");
                    return value;
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            public static IEnumerable<Kho> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("khos"));
            }
            public static IEnumerable<Kho> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("khos");
                    List<Kho> dskho = new List<Kho>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Kho kho = new Kho();
                        kho.id = item.id;
                        kho.id_nhomkho = item.id_nhomkho;
                        kho.nhomkho = item.nhomkho;
                        kho.ma = item.ma;
                        kho.stt = item.stt;
                        kho.ten = item.ten;
                        kho.ghichu = item.ghichu;
                        dskho.Add(kho);
                    }
                    return dskho;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class NhomKho
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string stt { get; set; }
            public string ten { get; set; }
            public string userid { get; set; }
            public static string GetAll()
            {
                try
                {
                    var value = Bridge.HttpGetApi("nhomkhos");
                    return value;
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            public static IEnumerable<NhomKho> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("nhomkhos"));
            }
            public static IEnumerable<NhomKho> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("nhomkhos");
                    List<NhomKho> dsnhomkho = new List<NhomKho>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        NhomKho nhomkho = new NhomKho();
                        nhomkho.id = item.id;
                        nhomkho.ma = item.ma;
                        nhomkho.stt = item.stt;
                        nhomkho.ten = item.ten;
                        nhomkho.userid = item.userid;
                        dsnhomkho.Add(nhomkho);
                    }
                    return dsnhomkho;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }

        }
        public class Thuoc
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
            public static string GetAll()
            {
                try
                {
                    var value = Bridge.HttpGetApi("thuocs");
                    return value;
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            public static IEnumerable<Thuoc> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("thuocs"));
            }
            public static IEnumerable<Thuoc> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("thuocs");
                    List<Thuoc> dsthuoc = new List<Thuoc>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Thuoc thuoc = new Thuoc();
                        thuoc.id = item.id;
                        thuoc.stt = item.stt;
                        thuoc.ma = item.ma;
                        thuoc.ten = item.ten;
                        thuoc.dang = item.dang;
                        thuoc.hamluong = item.hamluong;
                        thuoc.donvidg = item.donvidg;
                        thuoc.donvisd = item.donvisd;
                        thuoc.hoatchat = item.hoatchat;
                        thuoc.thanhphan = item.thanhphan;
                        thuoc.tyle1 = item.tyle1;
                        thuoc.tyle2 = item.tyle2;
                        thuoc.tinhtrang = item.tinhtrang;
                        thuoc.atc = item.atc;
                        thuoc.route = item.route;
                        thuoc.generic = item.generic;
                        thuoc.userid = item.userid;
                        thuoc.stt_40 = item.stt_40;
                        thuoc.sodk = item.sodk;
                        thuoc.ngay = item.ngay;
                        thuoc.ngayud = item.ngayud;
                        thuoc.id_loaiduoc = item.id_loaiduoc;
                        thuoc.ten_loaiduoc = item.ten_loaiduoc;
                        thuoc.id_hangsx = item.id_hangsx;
                        thuoc.ten_hangsx = item.ten_hangsx;
                        thuoc.id_quocgia = item.id_quocgia;
                        thuoc.ten_quocgia = item.ten_quocgia;
                        thuoc.id_duongdung = item.id_duongdung;
                        thuoc.ten_duongdung = item.ten_duongdung;
                        dsthuoc.Add(thuoc);
                    }
                    return dsthuoc;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class XuatBan
        {
            public IEnumerable<Kho> dmkho { get; set; }
            public XuatBan()
            {
                dmkho = null;
            }
            public XuatBan(IEnumerable<Kho> _kho)
            {
                dmkho = _kho;
            }
        }
        public class Nhapkhoct
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
            public static string GetAll()
            {
                try
                {
                    var value = Bridge.HttpGetApi("nhapkhocts");
                    return value;
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            public static IEnumerable<Nhapkhoct> GetAllObj()
            {
                //var value = Bridge.HttpGetApi("nhapkhocts");
                return GetAllObj(Bridge.HttpGetApi("nhapkhocts"));
            }
            public static IEnumerable<Nhapkhoct> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("nhapkhocts");
                    List<Nhapkhoct> ds = new List<Nhapkhoct>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Nhapkhoct obj = new Nhapkhoct();
                        obj.id = item.id;
                        obj.idnhapkho = item.idnhapkho;
                        obj.idduoc = item.idduoc;
                        obj.tenduoc = item.tenduoc;
                        obj.idnguon = item.idnguon;
                        obj.tennguon = item.tennguon;
                        obj.mavach = item.mavach;
                        obj.losx = item.losx;
                        obj.ngaysx = item.ngaysx;
                        obj.handung = item.handung;
                        obj.baohanh = item.baohanh;
                        obj.numeric = item.numeric;
                        obj.vat = item.vat;
                        obj.chietkhau = item.chietkhau;
                        obj.soluongdg = item.soluongdg;
                        obj.soluongsd = item.soluongsd;
                        obj.soluongn = item.soluongn;
                        obj.soluongx = item.soluongx;
                        obj.dongia = item.dongia;
                        obj.dongiavat = item.dongiavat;
                        obj.sotien = item.sotien;
                        obj.sotienvat = item.sotienvat;
                        obj.ghichu = item.ghichu;
                        obj.tinhtrang = item.tinhtrang;
                        obj.userid = item.userid;
                        obj.userten = item.userten;
                        obj.ngayud = item.ngayud;
                        obj.soluongyeucau = item.soluongyeucau;
                        ds.Add(obj);
                    }
                    return ds;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class Nhapkho
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
            public IEnumerable<Nhapkhoct> nhapkhocts { get; set; }
            public static string GetAll()
            {
                try
                {
                    var value = Bridge.HttpGetApi("nhapkhos");
                    return value;
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            public static IEnumerable<Nhapkho> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("nhapkhos"));
            }
            public static IEnumerable<Nhapkho> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("nhapkhos");
                    List<Nhapkho> ds = new List<Nhapkho>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Nhapkho obj = new Nhapkho();
                        obj.id = item.id;
                        obj.idlydonx = item.idlydonx;
                        obj.tenlydonx = item.tenlydonx;
                        obj.idnhacc = item.idnhacc;
                        obj.tennhacc = item.tennhacc;
                        obj.idkho = item.idkho;
                        obj.tenkho = item.tenkho;
                        obj.ngay = item.ngay;
                        obj.ngaytk = item.ngaytk;
                        obj.ngayhd = item.ngayhd;
                        obj.ngaykk = item.ngaykk;
                        obj.ngaynhan = item.ngaynhan;
                        obj.sophieu = item.sophieu;
                        obj.chietkhau = item.chietkhau;
                        obj.chiphivc = item.chiphivc;
                        obj.miengiam1 = item.miengiam1;
                        obj.miengiam2 = item.miengiam2;
                        obj.miengiam3 = item.miengiam3;
                        obj.miengiam4 = item.miengiam4;
                        obj.miengiam5 = item.miengiam5;
                        obj.vat = item.vat;
                        obj.sotien = item.sotien;
                        obj.sotienhd = item.sotienhd;
                        obj.nguoinhan = item.nguoinhan;
                        obj.nguoigiao = item.nguoigiao;
                        obj.noinhan = item.noinhan;
                        obj.ghichu = item.ghichu;
                        obj.tinhtrang = item.tinhtrang;
                        obj.userid = item.userid;
                        obj.userten = item.userten;
                        obj.ngayud = item.ngayud;
                        obj.nhapkhocts = Nhapkhoct.GetAllObj(item.nhapkhocts);
                        ds.Add(obj);
                    }
                    return ds;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        #endregion
    }
}