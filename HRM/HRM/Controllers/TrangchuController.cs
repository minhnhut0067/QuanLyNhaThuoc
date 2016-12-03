using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HRM.Controllers
{
    public class TrangchuController : Controller
    {
        public ActionResult Index()
        {
            ViewData["message"] = "Đăng nhập thành công !";
            ViewData["alert"] = "alert-success";
            ViewData["page"] = "page_nhansu_khaibaophongban"; 
            return View();
        }

        public ActionResult Nhanvien()
        {
            ViewData["page"] = "page_nhansu_khaibaonhanvien";
            return View();
        }
    }
}
