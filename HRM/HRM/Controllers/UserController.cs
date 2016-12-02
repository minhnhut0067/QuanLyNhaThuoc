using HRM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace HRM.Controllers
{
    public class UserController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Data.User.Login login)
        {
            if (ModelState.IsValid)
            {
                if (login.IsValid(login))//login.UserName, login.Password
                {
                    FormsAuthentication.SetAuthCookie(login.username_, login.rememberme);
                    var usr = new Data.User(login);
                    Session["User_Name"] = usr.hoten;
                    Session["User_Id"] = usr.iduser;
                    return RedirectToAction("Index", "Trangchu");
                }
                else
                {
                    ViewData["message"] = "Tài khoản hoặc mật khẩu không đúng !";
                    ViewData["alert"] = "alert-danger";
                    ModelState.AddModelError("", "Login data is incorrect!");
                }
            }
            return View(login);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.RemoveAll();
            return RedirectToAction("Login", "User");
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(Data.User.Register register)
        {
            return View(register);
        }

        public bool checkSession()
        {
            try
            {
                if (Session["User_Id"] != null)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
