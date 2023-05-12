using Final.DAO;
using Final.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class StoryController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: Story
        public ActionResult Index()
        {
            userLogin user = Session["user"] as userLogin;

            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var model=new StoryDAO().TaskThreeStory();
            return View(model);
        }
        public ActionResult AnotherStory()
        {
            var model = new StoryDAO().AnotherStory();
            return PartialView(model);
        }
        public ActionResult detail(string meta)
        {
            userLogin user = Session["user"] as userLogin;

            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var model = new StoryDAO().getByMeta(meta);
            return View(model);
        }
        public ActionResult all()
        {
            userLogin user = Session["user"] as userLogin;

            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            var modal = new StoryDAO().getAll();
            return View(modal);
        }
        public ActionResult Create()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("../home/login");
            }
            userLogin user = Session["user"] as userLogin;

            if (user.role == 2)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            ViewBag.sum = new Final.DAO.StoryDAO().sum() + 1;
            ViewBag.user = user.id;
            return View();
        }
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
        public ActionResult Edit(long? id)
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;

            if (user.role == 2)
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

            if (user.role == 2)
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
        public ActionResult historyStory(long id)
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;
            ViewBag.user = user.id;
            var stories = new StoryDAO().getByUserId(user.id);
            return PartialView(stories);
        }
        public ActionResult Details(long? id)
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin user = Session["user"] as userLogin;

            if (user.role == 2)
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
    }
}