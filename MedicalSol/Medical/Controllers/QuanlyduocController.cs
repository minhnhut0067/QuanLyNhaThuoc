using Medical.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Medical.Controllers
{
    public class QuanlyduocController : Controller
    {
        //
        // GET: /Quanlyduoc/

        public ActionResult Index()
        {
            return View();
        }

        #region Tiện Ích
        public ActionResult Khaibaokho()
        {
            //var Datanhomkho = new JObject();
            //Datanhomkho.Add("Name", "Table");
            //Datanhomkho.Add("Rows", JArray.Parse(Data.NhomKho.GetAll()));
            //ViewData["nhomkho_filter"] = Datanhomkho;
            Data.Filter filter = new Data.Filter(Data.NhomKho.GetAllObj());
            ViewBag.dsnhomkho = filter;
            return View(Data.Kho.GetAllObj());
        }
        #endregion

        public ActionResult Xuatban()
        {
            Data.XuatBan xuatban = new Data.XuatBan(Data.Kho.GetAllObj());
            //return View(bietduocs);
            var data = new Data();
            data.val = DataProcess.ConvertObjectToJsonString(xuatban);
            return View(data);
        }        
    }
}
