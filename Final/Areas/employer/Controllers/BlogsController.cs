using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Final.DAO;
using Final.Models;

namespace Final.Areas.employer.Controllers
{
    public class BlogsController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: employer/Blogs
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
            ViewBag.user = user.id;
            var blogs = new BlogDAO().getByUserId(user.id);
            return View(blogs);
        }

        // GET: employer/Blogs/Details/5
        public ActionResult Details(long? id)
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
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        // GET: employer/Blogs/Create
        public ActionResult Create()
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
            var list = new BlogCategoryDAO();
            ViewBag.CategoryId = new SelectList(list.getAll(), "id", "title");
            ViewBag.sum = new Final.DAO.BlogDAO().sum() + 1;
            ViewBag.user = user.id;
            return View();
        }

        // POST: employer/Blogs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,meta,title,content_story,CategoryId,displayOrder,hide,dateBegin,createBy,dateModife,modifedBy")] Blog blog)
        {
            if (ModelState.IsValid)
            {
                if (blog.displayOrder == null)
                {
                    var dOrder = new Final.DAO.BlogDAO().sum();
                    blog.displayOrder = dOrder + 1;

                }
                db.Blogs.Add(blog);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(blog);
        }

        // GET: employer/Blogs/Edit/5
        public ActionResult Edit(long? id)
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
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            var list = new BlogCategoryDAO();
            ViewBag.CategoryId = new SelectList(list.getAll(), "id", "title");
            return View(blog);
        }

        // POST: employer/Blogs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]

        public ActionResult Edit([Bind(Include = "id,meta,title,content_story,CategoryId,displayOrder,hide,dateBegin,createBy,dateModife,modifedBy")] Blog blog)
        {
            if (ModelState.IsValid)
            {
                userLogin user = Session["user"] as userLogin;
                blog.modifedBy = user.id;
                db.Entry(blog).State = EntityState.Modified;

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(blog);
        }

        // GET: employer/Blogs/Delete/5
        public ActionResult Delete(long? id)
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
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        // POST: employer/Blogs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {

            Blog blog = db.Blogs.Find(id);
            blog.hide = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        [HttpPost]
        public JsonResult Data()
        {
            ItJobDbContext db = new ItJobDbContext();

            userLogin user = Session["user"] as userLogin;
            ViewBag.user = user.id;
            var blogs = new BlogDAO().getByUserId(user.id);
            return Json(new { blogs = blogs, categories = db.BlogCategories.ToList() });
        }
    }
}
