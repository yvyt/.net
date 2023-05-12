using Final.DAO;
using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Final.Areas.employer.Controllers
{
    public class HomeController : Controller
    {
        // GET: employer/Home
        public ActionResult Index()
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;
            if (user.role != 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            return View();
        }
        public ActionResult login()
        {
            return View();
        }
        public ActionResult Menu()
        {
            userLogin user = Session["user"] as userLogin;
            return PartialView(user);
        }
    }
}
