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
    public class ProfileController : Controller
    {
        // GET: employer/Profile
        public ActionResult Index()
        {
            userLogin user = Session["user"] as userLogin;
            if (user == null)
            {
                return RedirectToAction("../home/login");

            }
            if (user.role != 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var model = new ProfileUserDAO().getByUserId((int)user.id);
            return View(model);
        }
        public ActionResult getDetails(int id)
        {
            var model = new UserDAO().getById(id);
            return PartialView(model);
        }
    }
}