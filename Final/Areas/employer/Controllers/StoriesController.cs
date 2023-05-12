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
    public class StoriesController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: admin/Stories
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
            var stories = new StoryDAO().getByUserId(user.id);
            return View(stories);
        }

        // GET: admin/Stories/Details/5
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
            Story story = db.Stories.Find(id);
            if (story == null)
            {
                return HttpNotFound();
            }
            return View(story);
        }

        // GET: admin/Stories/Create
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
            ViewBag.sum = new Final.DAO.StoryDAO().sum() + 1;
            ViewBag.user = user.id;
            return View();
        }

        // POST: admin/Stories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "id,meta,title,content_story,displayOrder,hide,dateBegin,createBy,dateModife,modifedBy")] Story story)
        {
            if (ModelState.IsValid)
            {
                if (story.displayOrder == null)
                {
                    var dOrder = new Final.DAO.StoryDAO().sum();
                    story.displayOrder = dOrder + 1;
                }
                db.Stories.Add(story);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(story);
        }

        // GET: admin/Stories/Edit/5
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
            Story story = db.Stories.Find(id);
            if (story == null)
            {
                return HttpNotFound();
            }
            return View(story);
        }

        // POST: admin/Stories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]

        public ActionResult Edit([Bind(Include = "id,meta,title,content_story,displayOrder,hide,dateBegin,createBy,dateModife,modifedBy")] Story story)
        {
            if (ModelState.IsValid)
            {
                userLogin user = Session["user"] as userLogin;
                story.modifedBy = user.id;
                db.Entry(story).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(story);
        }

        // GET: admin/Stories/Delete/5
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
            Story story = db.Stories.Find(id);
            if (story == null)
            {
                return HttpNotFound();
            }
            return View(story);
        }

        // POST: admin/Stories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Story story = db.Stories.Find(id);
            story.hide = false;
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
            userLogin user = Session["user"] as userLogin;
            ViewBag.user = user.id;
            var stories = new StoryDAO().getByUserId(user.id);
            ItJobDbContext db = new ItJobDbContext();
            return Json(stories);
        }
    }
}
