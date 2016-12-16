using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Medical.Models
{
    public class SessionExpireAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpContext ctx = HttpContext.Current;
            // check  sessions here
            if (HttpContext.Current.Session["ms_userid"] == null)
            {
                filterContext.Result = new RedirectResult("~/User/Login");
                return;
            }
            //else
            //{
            //    filterContext.Result = new RedirectResult("~/Trangchu/Index");
            //    return;
            //}            
            base.OnActionExecuting(filterContext);
        }
    }
}