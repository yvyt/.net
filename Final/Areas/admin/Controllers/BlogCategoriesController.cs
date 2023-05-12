using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Final.Models;

namespace Final.Areas.admin.Controllers
{
    public class BlogCategoriesController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: admin/BlogCategories
        public ActionResult Index()
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;
            if (user.role != 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            return View(db.BlogCategories.ToList());
        }

        // GET: admin/BlogCategories/Details/5
        public ActionResult Details(long? id)
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;
            if (user.role != 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BlogCategory blogCategory = db.BlogCategories.Find(id);
            if (blogCategory == null)
            {
                return HttpNotFound();
            }
            return View(blogCategory);
        }

        // GET: admin/BlogCategories/Create
        public ActionResult Create()
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;
            if (user.role != 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var sum = new Final.DAO.BlogCategoryDAO().sum();
            ViewBag.sum = sum;
            ViewBag.user = user.id;
            return View();
        }

        // POST: admin/BlogCategories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,title,description,link,meta,displayOrder,hide,dateBegin,createBy,dateModife,modifedBy")] BlogCategory blogCategory)
        {
            if (ModelState.IsValid)
            {
                if (blogCategory.displayOrder == null)
                {
                    var dOrder=new Final.DAO.BlogCategoryDAO().sum();
                    blogCategory.displayOrder = dOrder + 1;
                }
                db.BlogCategories.Add(blogCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(blogCategory);
        }

        // GET: admin/BlogCategories/Edit/5
        public ActionResult Edit(long? id)
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;
            if (user.role !=0 )
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BlogCategory blogCategory = db.BlogCategories.Find(id);
            if (blogCategory == null)
            {
                return HttpNotFound();
            }
            
            return View(blogCategory);
        }

        // POST: admin/BlogCategories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]

        public ActionResult Edit([Bind(Include = "id,title,description,link,meta,displayOrder,hide,dateBegin,createBy,dateModife,modifedBy")] BlogCategory blogCategory)
        {

            if (ModelState.IsValid)
            {
                userLogin user = Session["user"] as userLogin;
                blogCategory.modifedBy = user.id;
                db.Entry(blogCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(blogCategory);
        }

        // GET: admin/BlogCategories/Delete/5
        public ActionResult Delete(long? id)
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;
            if (user.role != 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BlogCategory blogCategory = db.BlogCategories.Find(id);
            if (blogCategory == null)
            {
                return HttpNotFound();
            }
            return View(blogCategory);
        }

        // POST: admin/BlogCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            BlogCategory blogCategory = db.BlogCategories.Find(id);
            blogCategory.hide = false;
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
            return Json(db.BlogCategories.ToList());
        }
    }
}
