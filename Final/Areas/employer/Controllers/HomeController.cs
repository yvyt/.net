using Final.DAO;
using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
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
            return View();
        }
        public ActionResult login()
        {
            return View();
        }
    }
}
