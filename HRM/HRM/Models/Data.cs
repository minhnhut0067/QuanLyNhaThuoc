using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HRM.Models
{
    public class Data
    {
        private static string DefaultUrl = "http://localhost:48187/";
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
        public class Phongban
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public string ghichu { get; set; }
            public static string GetAll()
            {
                try
                {
                    var value = Bridge.HttpGetApi("phongbans");
                    return value;
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            public static IEnumerable<Phongban> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("phongbans"));
            }
            public static IEnumerable<Phongban> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("khos");
                    List<Phongban> lts = new List<Phongban>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Phongban obj = new Phongban();
                        obj.id = item.id;
                        obj.ma = item.ma;
                        obj.ten = item.ten;
                        obj.ghichu = item.ghichu;
                        lts.Add(obj);
                    }
                    return lts;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
        public class Dmphai
        {
            public string id { get; set; }
            public string ma { get; set; }
            public string ten { get; set; }
            public static string GetAll()
            {
                try
                {
                    var value = Bridge.HttpGetApi("phongbans");
                    return value;
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            public static IEnumerable<Dmphai> GetAllObj()
            {
                return GetAllObj(Bridge.HttpGetApi("dmphais"));
            }
            public static IEnumerable<Dmphai> GetAllObj(string value)
            {
                try
                {
                    //var value = Bridge.HttpGetApi("khos");
                    List<Dmphai> lts = new List<Dmphai>();
                    var jarr = JArray.Parse(value);
                    foreach (dynamic item in jarr)
                    {
                        Dmphai obj = new Dmphai();
                        obj.id = item.id;
                        obj.ma = item.ma;
                        obj.ten = item.ten;
                        lts.Add(obj);
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
    }
}