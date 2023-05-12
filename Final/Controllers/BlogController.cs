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
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index()
        {
            userLogin user = Session["user"] as userLogin;
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var model=new BlogCategoryDAO().getAll();
            return View(model);
        }
        public ActionResult getBlogs()
        {
            userLogin user = Session["user"] as userLogin;
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var model = new BlogDAO().getAll();

            return PartialView(model);
        }
        public ActionResult detail(string meta)
        {
            userLogin user = Session["user"] as userLogin;
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var blog = new BlogDAO().getByMeta(meta);
            return View(blog);
        }
        public ActionResult all()
        {
            userLogin user = Session["user"] as userLogin;
            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var all=new BlogDAO().all();
            return View(all);
        }
    }
}