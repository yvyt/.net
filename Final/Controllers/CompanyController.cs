using Final.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class CompanyController : Controller
    {
        // GET: Company
        public ActionResult Index()
        {
            var model=new CompanyDAO().getAll();
            return View(model);
        }
        public ActionResult Details(string meta)
        {
            var model = new CompanyDAO().getByMeta(meta);
            return View(model);
        }
        public ActionResult Rate(long id)
        {
            ViewBag.rate= new CommentDAO().avgRate(id);
            return PartialView();
        }
        public ActionResult Comments(long id)
        {
            var model = new CommentDAO().GetCommentsOfCompany(id);
            return PartialView(model);
        }
        public ActionResult RateOverView(long id)
        {
            ViewBag.rate = new CommentDAO().avgRate(id);
            return PartialView();
        }
    }
}