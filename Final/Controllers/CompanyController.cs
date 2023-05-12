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
    public class CompanyController : Controller
    {
        // GET: Company
        public ActionResult Index()
        {
            userLogin user = Session["user"] as userLogin;
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var model=new CompanyDAO().getAll();
            return View(model);
        }
        public ActionResult Details(string meta)
        {
            userLogin user = Session["user"] as userLogin;
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var model = new CompanyDAO().getByMeta(meta);
            return View(model);
        }
        public ActionResult Rate(long id)
        {
            userLogin user = Session["user"] as userLogin;
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            ViewBag.rate= new CommentDAO().avgRate(id);
            return PartialView();
        }
        public ActionResult Comments(long id)

        {
            userLogin user = Session["user"] as userLogin;
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var model = new CommentDAO().GetCommentsOfCompany(id);
            return PartialView(model);
        }
        public ActionResult RateOverView(long id)
        {
            userLogin user = Session["user"] as userLogin;
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            ViewBag.rate = new CommentDAO().avgRate(id);
            return PartialView();
        }
    }
}