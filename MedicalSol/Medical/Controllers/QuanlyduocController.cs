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
            ViewData["page"] = "page_duoc_khaibaokho";            
            return View(Data.Kho.GetAllObj());
        }

        public ActionResult Khaibaothuoc()
        {
            ViewData["page"] = "page_duoc_khaibaothuoc"; 
            return View(Data.Thuoc.GetAllObj());
        }
        #endregion

        public ActionResult Nhapkho()        
        {
            ViewData["page"] = "page_duoc_nhapkho";
            return View(Data.Nhapkho.GetAllObj());
        }
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
