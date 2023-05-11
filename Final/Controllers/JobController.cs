using Final.DAO;
using Final.Models;
using System;
using System.Collections.Generic;
using System.IO;
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

        public ActionResult getJob(int id,string meta)
        {
            ViewBag.Meta = meta;
            var model = new JobDAO().getAll(id);
            return PartialView(model);
        }
        public ActionResult getCompanyByJob(long id)
        {
            var model = new CompanyDAO().getById(id);
            return PartialView(model);
        }
        public ActionResult getJobDetail(long id)
        {
            var model = new JobDAO().getJobDetail(id);
            return PartialView(model);
        }
        public ActionResult getCompanyDetailByJob(long id)
        {
            var model = new CompanyDAO().getById(id);
            return PartialView(model);
        }
        public ActionResult companyOverView(long id)
        {
            var model = new CompanyDAO().getById(id);
            return PartialView(model);
        }
        public ActionResult applyJob(long id)
        {
            userLogin user = Session["user"] as userLogin;
            if (user == null)
            {
                return RedirectToAction("../home/login");

            }
            ViewBag.username=user.username;
            var model = new JobDAO().getJobDetail(id);
            return View(model);
        }
        [HttpPost]
        public ActionResult jobApply(string jobId,string name,HttpPostedFileBase file)
        {
            userLogin user = Session["user"] as userLogin;
            if (user == null)
            {
                return RedirectToAction("../home/login");
            }

            var email = user.email;
            if (file != null && file.ContentLength > 0)
            {
                var cvPath = Server.MapPath("~/Assets/home/cv/" + email);
                if (!Directory.Exists(cvPath))
                {
                    Directory.CreateDirectory(cvPath);
                }
                if (Path.GetExtension(file.FileName).ToLower() == ".pdf")
                {
                    string fileName = Path.GetFileName(file.FileName);
                    string path = Path.Combine(cvPath, fileName);
                    file.SaveAs(path);
                    DateTime today = DateTime.Now;
                    UserApply u = new UserApplyDAO().apply(user.id,long.Parse(jobId),path,today);
                    ViewBag.Success = "File uploaded successfully";
                }
                else
                {
                    ViewBag.Message = "Please upload a PDF file";
                }
            }
            else
            {
                ViewBag.Message = "Please choose a file to upload";
            }
            return View();

        }

    }
}