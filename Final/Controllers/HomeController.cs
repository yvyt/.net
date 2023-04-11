using Final.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class HomeController : Controller
    {

        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Menu()
        {
            var model = new MenuDAO().getAll();
            return PartialView(model);
        }
        public ActionResult Footer() {
            var model = new FooterDAO().getALL();
            return PartialView(model);
        }
        public ActionResult JobCategory()
        {
            var model = new JobCategoryDAO().getShowOnHome();
            return PartialView(model);
        }
        public ActionResult Job(long id)
        {
            var model = new JobDAO().getAll(id);
            return PartialView(model);
        }
        public ActionResult CompanyByJob(long id)
        {
            var model = new CompanyDAO().getByJob(id);
            return PartialView(model);
        }
        public ActionResult getSlide()
        {
            var model = new SlideDAO().getSlide();
            return PartialView(model);
        }
        public ActionResult getByIdMenu(int id)
        {
            var model = new MenuDAO().getParent(id);
            return PartialView(model);
        }
    }
}