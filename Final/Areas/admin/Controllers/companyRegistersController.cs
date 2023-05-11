using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Policy;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Services.Description;
using Final.DAO;
using Final.Models;

namespace Final.Areas.admin.Controllers
{
    public class companyRegistersController : Controller
    {
        private ItJobDbContext db = new ItJobDbContext();

        // GET: admin/companyRegisters
        public ActionResult Index()
        {
            return View(db.CompanyRegisters.ToList());
        }

        // GET: admin/companyRegisters/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            companyRegister companyRegister = db.CompanyRegisters.Find(id);
            if (companyRegister == null)
            {
                return HttpNotFound();
            }
            return View(companyRegister);
        }
        // GET: admin/companyRegisters/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            companyRegister companyRegister = db.CompanyRegisters.Find(id);
            if (companyRegister == null)
            {
                return HttpNotFound();
            }
            DateTime today = DateTime.Now;
            string todayString = today.ToString("yyyy-MM-dd");
            userLogin user = Session["user"] as userLogin;
            var username = user.username;
            Company company = new Company(companyRegister.name,ToSlug(companyRegister.name),companyRegister.type,companyRegister.location,companyRegister.website,today,username,today,username,user.id);
            db.Companies.Add(company);
            User u=new UserDAO().findUser(companyRegister.email);
            if (u == null)
            {
                return HttpNotFound();
            }
            u.status = true;
            db.Entry(u).State = EntityState.Modified; // Mark the User object as modified so it gets updated in the database
            db.CompanyRegisters.Remove(companyRegister);
            db.SaveChanges();
            try
            {
                string url = "https://localhost:44376/Home";
                MailMessage mail = new MailMessage();
                SmtpClient smtpServer = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("huynhnguyentuongvy293@gmail.com");
                mail.To.Add(u.email);
                mail.Subject = "Thông báo xét duyệt tài khoản tuyển dụng";
                mail.Body = $"Cảm ơn bạn đã đăng ký tài khoản trên hệ thống của chúng tôi." +
                    $"Tài khoản của bạn đã được duyệt.Nhấn vào <a href=\"{url}\">Đây</a> để trở lại trang web.";
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

        
        // GET: admin/companyRegisters/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            companyRegister companyRegister = db.CompanyRegisters.Find(id);
            if (companyRegister == null)
            {
                return HttpNotFound();
            }
            companyRegister.active = false;
            
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
        public string ToSlug(string str)
        {
            // Replace spaces and underscores with hyphens
            str = str.Replace(" ", "_").Replace("-", "_");

            // Remove invalid characters
            str = Regex.Replace(str, "[^a-zA-Z0-9-]", "", RegexOptions.Compiled);

            // Remove consecutive hyphens
            str = Regex.Replace(str, "-{2,}", "_", RegexOptions.Compiled);

            // Remove leading and trailing hyphens
            str = str.Trim('-');

            // Convert to lowercase
            str = str.ToLower();

            return str;
        }
        

    }
}

