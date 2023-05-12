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

namespace Final.Areas.admin.Controllers
{
    public class UsersController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: admin/Users
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
            return View(db.Users.ToList());
        }

        // GET: admin/Users/Details/5
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
            User u = db.Users.Find(id);
            if (u == null)
            {
                return HttpNotFound();
            }
            return View(u);
        }

       
        // GET: admin/Users/Edit/5
        public ActionResult Edit(long? id)
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
            User u = db.Users.Find(id);
            if (u == null)
            {
                return HttpNotFound();
            }
            return View(u);
        }

        // POST: admin/Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,username,password,email,role,status")] User user)
        {
            var company = new CompanyDAO().getByUser(user.id);
            if (ModelState.IsValid)
            {
                if (user.status == false)
                {
                    company.hide = false;
                }
                else
                {
                    company.hide = true;
                }
                db.Entry(company).State = EntityState.Modified;

                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(user);
        }

        // GET: admin/Users/Delete/5
        public ActionResult Delete(long? id)
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            userLogin u = Session["user"] as userLogin;
            if (u.role != 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: admin/Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            User user = db.Users.Find(id);
            var company = new CompanyDAO().getByUser(user.id);
            company.hide = false;
            db.Entry(company).State = EntityState.Modified;

            user.status = false;
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
            return Json(db.Users.ToList());
        }
        public ActionResult userRegister()
        {
            return View();
        }
    }
}
