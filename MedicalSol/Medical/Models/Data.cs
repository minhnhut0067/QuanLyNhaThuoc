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
        public string val { get; set; }

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
                    //DataSet ds = new DataSet();
                    //string sql = "";
                    //sql = @"SELECT iduser, username_, password_, hoten, ngaysinh, diachi, sdt, email, " +
                    //@"ngay, ngayud, loaiuser " +
                    //@"FROM users " +
                    //@"WHERE username_ = '" + _username + "' AND password_ = '" + Helpers.SHA1.Encode(_password) + "';";
                    //ds = Helpers.dbHelper.getDataSetbySql(sql);
                    //if (ds != null && ds.Tables[0].Rows.Count > 0)
                    //{
                    //    foreach (DataRow dr in ds.Tables[0].Rows)
                    //    {
                    //        Id = Int32.Parse(dr["iduser"].ToString());
                    //        Name = dr["name"].ToString();
                    //        dob = dr["dob"].ToString();
                    //        Email = dr["email"].ToString();
                    //        Address = dr["address"].ToString();
                    //    }
                    //}
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
                try
                {
                    var value = Bridge.HttpGetApi("nhomkhos");
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
                try
                {
                    var value = Bridge.HttpGetApi("khos");
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
                try
                {
                    var value = Bridge.HttpGetApi("thuocs");
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

        public class Table
        {
            public string Obj { get; set; }
        }
    }
}