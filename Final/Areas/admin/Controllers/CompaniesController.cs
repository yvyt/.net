using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Final.DAO;
using Final.Models;

namespace Final.Areas.admin.Controllers
{
    public class CompaniesController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: admin/Companies
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
            return View(db.Companies.ToList());
        }

        // GET: admin/Companies/Details/5
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
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
        }



        // GET: admin/Companies/Edit/5
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
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
        }

        // POST: admin/Companies/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id,name,meta,type,country,location,website,detail,contact,hide,dateBegin,createBy,dateModife,modifedBy,image,OT,employers,userId")] Company company, HttpPostedFileBase image)
        {
            var path = "";
            var filename = "";
            var dao = new CompanyDAO();
            Company tempCompany = dao.getById(company.id);
            var imgPath = "/Assets/home/images/company/";
            var user = new UserDAO().getById((int)company.userId);
            userLogin u = Session["user"] as userLogin;

            if (ModelState.IsValid)
            {
                if (company.hide == false)
                {
                    user.status = false;
                }
                else
                {
                    user.status = true;
                }
                db.Entry(user).State = EntityState.Modified;

                if (image != null)
                {
                    filename = DateTime.UtcNow.ToString("dd-MM-yy-hh-mm-ss") + image.FileName;
                    path = Path.Combine(Server.MapPath("~/Assets/home/images/company"), filename);
                    image.SaveAs(path);
                    imgPath = imgPath + filename;
                    tempCompany.image = imgPath;
                }
                
                tempCompany.name = company.name;
                tempCompany.meta = company.meta;
                tempCompany.type = company.type;
                tempCompany.country = company.country;
                tempCompany.location = company.location;
                tempCompany.website = company.website;
                tempCompany.detail = company.detail;
                tempCompany.contact = company.contact;
                tempCompany.hide = company.hide;
                tempCompany.dateBegin = company.dateBegin;
                tempCompany.createBy = company.createBy;
                tempCompany.modifedBy = u.id;
                tempCompany.dateModife = company.dateModife;
                tempCompany.OT = company.OT;
                tempCompany.userId = company.userId;
                tempCompany.employers = company.employers;

                db.Entry(tempCompany).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(company);
        }

        // GET: admin/Companies/Delete/5
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
            Company company = db.Companies.Find(id);
            if (company == null)
            {
                return HttpNotFound();
            }
            return View(company);
        }

        // POST: admin/Companies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Company company = db.Companies.Find(id);
            var u = new UserDAO().getById((int)company.userId);
            u.status = false;
            db.Entry(u).State = EntityState.Modified;
            company.hide=false;
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
            return Json(db.Companies.ToList());
        }
    }
}
