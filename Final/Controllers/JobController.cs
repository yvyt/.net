using Final.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class JobController : Controller
    {
        // GET: Job
        public ActionResult Index(string meta)
        {
            var model = new JobCategoryDAO().getByMeta(meta);

            return View(model);
        }

        public ActionResult getJob(long id,string meta)
        {
            ViewBag.Meta = meta;
            var model = new JobDAO().getAll(id);
            return PartialView(model);
        }
        public ActionResult getCompanyByJob(long id)
        {
            var model = new CompanyDAO().getByJob(id);
            return PartialView(model);
        }
        public ActionResult getJobDetail(long id)
        {
            var model = new JobDAO().getJobDetail(id);
            return PartialView(model);
        }
        public ActionResult getCompanyDetailByJob(long id)
        {
            var model = new CompanyDAO().getByJobId(id);
            return PartialView(model);
        }
        public ActionResult companyOverView(long id)
        {
            var model = new CompanyDAO().getByJobId(id);
            return PartialView(model);
        }
        public ActionResult applyJob(long id)
        {
            var model = new JobDAO().getJobDetail(id);
            return View(model);
        }
    }
}