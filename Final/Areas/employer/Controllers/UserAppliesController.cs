using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using Final.DAO;
using Final.Models;

namespace Final.Areas.employer.Controllers
{
    public class UserAppliesController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: employer/UserApplies
        public ActionResult Index()
        {
            userLogin user = Session["user"] as userLogin;

            var modal = new UserApplyDAO().job(user.id);
            return View(modal);
        }

        // GET: employer/UserApplies/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserApply userApply = db.UserApplies.Find(id);
            if (userApply == null)
            {
                return HttpNotFound();
            }
            userApply.status = 1;
            db.SaveChanges();
            User u = new UserDAO().getById((int)userApply.userId);
            Job j = new JobDAO().getById((int)userApply.jobId);
            Company c = new CompanyDAO().getById(j.companyID);
            try
            {
                string url = "https://localhost:44376/Home";
                MailMessage mail = new MailMessage();
                SmtpClient smtpServer = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("huynhnguyentuongvy293@gmail.com");
                mail.To.Add(u.email);
                mail.Subject = "Thông báo xét duyệt CV";
                mail.Body = $"Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi." +
                    $"CV của bạn ứng tuyển vào công việc " + j.name +
                    $" đã được công ty "+c.name+
                    $" duyệt qua.Hãy kiểm tra thường xuyên email và điện thoại để nhận lịch phỏng vấn từ công ty.";
                mail.IsBodyHtml = true;

                smtpServer.Port = 587;
                smtpServer.Credentials = new System.Net.NetworkCredential("huynhnguyentuongvy293@gmail.com", "tahgsyesyfrjdaux");
                smtpServer.EnableSsl = true;

                smtpServer.Send(mail);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "Error: " + ex.Message;
                return View();
            }

        }


        // GET: employer/UserApplies/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserApply userApply = db.UserApplies.Find(id);
            if (userApply == null)
            {
                return HttpNotFound();
            }
            userApply.status = 2;
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
        public ActionResult DownloadPdf(int user,string cv)
        {
            User u= new UserDAO().getById(user);
            string email = u.email;
            int index = cv.LastIndexOf("\\");
            string name = cv.Substring(index+1);
            string filePath = Server.MapPath("~/Assets/home/cv/"+email+"/"+name); // replace with the path to the PDF file to download
            return File(filePath, "application/pdf", name);
        }

    }
}
