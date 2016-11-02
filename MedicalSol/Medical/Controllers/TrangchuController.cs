using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Medical.Controllers
{
    public class TrangchuController : Controller
    {
        //
        // GET: /Trangchu/

        [Authorize]
        public ActionResult Index()
        {
            ViewBag.Message = "Đăng nhập thành công !";
            ViewBag.Alert = "alert-success";
            return View();
        }

    }
}
