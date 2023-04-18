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
    public class MenusController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: admin/Menus
        public ActionResult Index()
        {
            return View(db.Menus.ToList());
        }

        // GET: admin/Menus/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(menu);
        }

     

        public List<SelectListItem> getList()
        {
            var menus = db.Menus.ToList();
            var listItems = new List<SelectListItem>();
            foreach (var menu in menus)
            {
                listItems.Add(new SelectListItem()
                {
                    Text = menu.name,
                    Value = menu.id.ToString(),
                }) ;
            }
            return listItems;
        }

        // GET: admin/Menus/Create
        public ActionResult Create()
        {
            var dao = new MenuDAO();
            ViewBag.inner_menu = new SelectList(dao.getInnerCreate(), "id", "name");
            var sum = dao.sum();
            ViewBag.sum = sum;
            return View();
        }

        // POST: admin/Menus/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,link,meta,modifedBy,displayOrder,hide,inner_menu,dateBegin,createBy,dateModife")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                if (menu.displayOrder == null)
                {
                    var dOrder = new Final.DAO.MenuDAO().sum();
                    menu.displayOrder = dOrder+1;
                }
                db.Menus.Add(menu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(menu);
        }

        // GET: admin/Menus/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            var dao = new MenuDAO();
            var options = dao.getInnerCreate();
            ViewBag.inner_menu = new SelectList(options, "id", "name");
            return View(menu);
        }

        // POST: admin/Menus/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,link,meta,modifedBy,displayOrder,hide,inner_menu,dateBegin,createBy,dateModife")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(menu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(menu);
        }

        // GET: admin/Menus/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(menu);
        }

        // POST: admin/Menus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Menu menu = db.Menus.Find(id);
            /*            db.Menus.Remove(menu);
            */
            if (menu == null)
            {
                return HttpNotFound();
            }
            menu.hide = false;
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
