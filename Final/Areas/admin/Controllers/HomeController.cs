using Final.DAO;
using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Final.Areas.admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: admin/Home
        public ActionResult Index()
        {

            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;
            if (user.role != 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            return View();
        }
        public ActionResult Menu()
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;
            if (user.role != 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            return View(user);
        }
        
    }
}