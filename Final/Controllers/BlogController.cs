using Final.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index()
        {
            var model=new BlogCategoryDAO().getAll();
            return View(model);
        }
        public ActionResult getBlogs()
        {
            var model = new BlogDAO().getAll();

            return PartialView(model);
        }
    }
}