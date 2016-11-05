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
            ViewData["message"] = "Đăng nhập thành công !";
            ViewData["alert"] = "alert-success";
            return View();
        }

    }
}
