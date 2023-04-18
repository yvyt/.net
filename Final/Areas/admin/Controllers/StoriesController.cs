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
    public class StoriesController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: admin/Stories
        public ActionResult Index()
        {
            return View(db.Stories.ToList());
        }

        // GET: admin/Stories/Details/5
        public ActionResult Details(long? id)
        {
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
            ViewBag.sum = new Final.DAO.StoryDAO().sum() + 1;

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
                db.Entry(story).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(story);
        }

        // GET: admin/Stories/Delete/5
        public ActionResult Delete(long? id)
        {
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
            story.hide=false;
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
    }
}
