using Final.DAO;
using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Areas.admin.Controllers
{
    public class tempController : Controller
    {
        // GET: admin/temp
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult getCateById(int id)
        {
            var cate = new JobCategoryDAO().getById(id);
            return PartialView(cate);
        }
        public ActionResult getCompanyByJobId(int id)
        {

            var model=new CompanyDAO().getByJobId(id);
            return PartialView(model);
        }
        public ActionResult InnerMenu(int inner)
        {
            var modal=new MenuDAO().getInner(inner);
            return PartialView(modal);
        }
    }
}