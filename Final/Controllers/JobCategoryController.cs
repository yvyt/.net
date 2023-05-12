using Final.DAO;
using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class JobCategoryController : Controller
    {
        // GET: JobCategory
        public ActionResult Index()
        {
            userLogin user = Session["user"] as userLogin;
            if (user == null)
            {
                return RedirectToAction("login");

            }
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var modal = new JobCategoryDAO().get();
            return View(modal);
        }
    }
}