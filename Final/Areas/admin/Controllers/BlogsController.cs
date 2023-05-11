using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Final.DAO;
using Final.Models;

namespace Final.Areas.admin.Controllers
{
    public class BlogsController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: admin/Blogs
        public ActionResult Index()
        {
            return View(db.Blogs.ToList());
        }

        // GET: admin/Blogs/Details/5
        public ActionResult Details(long? id)
        {
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

        // GET: admin/Blogs/Create
        public ActionResult Create()
        {
            var list = new BlogCategoryDAO();
            ViewBag.CategoryId = new SelectList(list.getAll(), "id", "title");
            ViewBag.sum = new Final.DAO.BlogDAO().sum() + 1;
            return View();
        }

        // POST: admin/Blogs/Create
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

        // GET: admin/Blogs/Edit/5
        public ActionResult Edit(long? id)
        {
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

        // POST: admin/Blogs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]

        public ActionResult Edit([Bind(Include = "id,meta,title,content_story,CategoryId,displayOrder,hide,dateBegin,createBy,dateModife,modifedBy")] Blog blog)
        {
            if (ModelState.IsValid)
            {
                db.Entry(blog).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(blog);
        }

        // GET: admin/Blogs/Delete/5
        public ActionResult Delete(long? id)
        {
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

        // POST: admin/Blogs/Delete/5
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
            return Json(new {blogs= db.Blogs.ToList() , categories=db.BlogCategories.ToList()});
        }
    }
}
