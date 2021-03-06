﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ApiManageSolution.Models
{    
    public class Users
    {
        dbHelper dbh = new dbHelper();
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
        public string tencoso { get; set; }
        public static IEnumerable<Users> GetAll()
        {
            try
            {
                DataSet ds = new DataSet();
                List<Users> lts = new List<Users>();
                string sql = "";
                sql = "SELECT b.ten as tencoso, a.id as iduser, a.username_, a.password_, a.hoten, a.ngaysinh, a.diachi, a.sdt, a.email, a.ngay, a.ngayud, a.loaiuser" +
                "\nFROM users a LEFT JOIN dmcoso b on b.id = left(a.id,10);";
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
                        item.tencoso = dr["tencoso"].ToString();
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