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
            public string ma { get; set; }
            public string ten { get; set; }
            public string tenhc { get; set; }
            public string sodk { get; set; }
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
                    Thuoc thuoc = new Thuoc();
                    var jarr = JArray.Parse(value);
                    foreach (var item in jarr)
                    {
                        thuoc.id = "";
                        thuoc.ma = "";
                        thuoc.ten = "";
                        thuoc.tenhc = "";
                        thuoc.sodk = "";
                    }
                    return null;
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

        public class Filter
        {
            public string Name { get; set; }
            public Object Rows { get; set; }
            public Filter()
            {
                this.Name = "Table";
                this.Rows = null;
            }
            public Filter(Object jarr)
            {
                this.Name = "Table";
                this.Rows = jarr;
            }
        }
    }
}