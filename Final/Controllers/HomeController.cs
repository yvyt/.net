using Final.DAO;
using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class HomeController : Controller
    {

        // GET: Home
        public ActionResult Index()
        {
            
            return View();
        }
        public ActionResult Menu()
        {
            var model = new MenuDAO().getAll();
            userLogin user = Session["user"] as userLogin;
            if (user != null)
            {
                ViewBag.userCurrent = user.username;
            }
            return PartialView(model);
        }
        public ActionResult Footer() {
            var model = new FooterDAO().getALL();
            return PartialView(model);
        }
        public ActionResult JobCategory()
        {
            var model = new JobCategoryDAO().getShowOnHome();
            return PartialView(model);
        }
        public ActionResult Job(long id)
        {
            var model = new JobDAO().getAll(id);
            return PartialView(model);
        }
        public ActionResult CompanyByJob(long id)
        {
            var model = new CompanyDAO().getById(id);
            return PartialView(model);
        }
        public ActionResult getSlide()
        {
            var model = new SlideDAO().getSlide();
            return PartialView(model);
        }
        public ActionResult getByIdMenu(int id)
        {
            var model = new MenuDAO().getParent(id);
            return PartialView(model);
        }
        public ActionResult login()
        {
            userLogin user = Session["user"] as userLogin;
            if (user != null)
            {
                return RedirectToAction("Index");

            }
            return View();
        }
        public ActionResult register()
        {
            userLogin user = Session["user"] as userLogin;
            if (user != null)
            {
                return RedirectToAction("Index");

            }
            return View();
        }
        public ActionResult logout()
        {
            Session.Remove("user");
            return RedirectToAction("Index");
        }
        public ActionResult profile()
        {
            userLogin user = Session["user"] as userLogin;
            if (user == null)
            {
                return RedirectToAction("login");

            }
            var model = new ProfileUserDAO().getByUserId((int)user.id);

            return View(model);
        }
        public ActionResult getDetails(int id)
        {
            var model = new UserDAO().getById(id);
            return PartialView(model);
        }
        public ActionResult getHistoryApply(int id)
        {
            var model= new UserApplyDAO().getByUserId(id);
            return PartialView(model);
        }
        public ActionResult getJobById(int id)
        {
            var model = new JobDAO().getById(id);
            return PartialView(model);
        }
        public ActionResult getCompany(int id)
        {
            var model = new JobDAO().getById(id);
            var compay = new CompanyDAO().getById(model.companyID);
            return PartialView(compay);
        }
        public ActionResult employerRegister()
        {
            return View();
        }
        [HttpPost]
        public ActionResult updateProfile(string id,string fullname, string phone, string address)
        {
            var profile= new ProfileUserDAO().getById(int.Parse(id));
            if (profile == null)
            {
                return Json(new { code = 400, msg = "Đã xảy ra lỗi trong quá tình cập nhật" }, JsonRequestBehavior.AllowGet);

            }
            var update= new ProfileUserDAO().updateProfile(int.Parse(id),fullname,phone,address);
            if (update == null)
            {
                return Json(new { code = 400, msg = "Đã xảy ra lỗi trong quá tình cập nhật" }, JsonRequestBehavior.AllowGet);

            }
            return Json(new
            {
                code = 200,
                msg = "Cập nhật thành công",
                update=update,
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult UsLogin(string email, string password)
        {
            if (email != "" && password != "")
            {
                var modal = new UserDAO().login(email, password);
                
                if (modal != null)
                {
                    Session["user"] = new userLogin(modal.id,modal.username, password, email,modal.role,modal.status);
                    String link = "";
                    if (modal.role == 0)
                    {
                        link = "/admin/";
                    }else if(modal.role== 1)
                    {
                        link = "/home";

                    }
                    else
                    {
                        link = "/employer";
                    }
                    return Json(new
                    {
                        code = 200,
                        msg = "Đăng nhập thành công",
                        link= link,
                    }, JsonRequestBehavior.AllowGet);
                }
                else

                {
                    return Json(new { code = 500, msg = "Tài khoản hoặc mật khẩu của bạn sai" }, JsonRequestBehavior.AllowGet);

                }
            }
            else
            {
                return Json(new { code = 500, msg = "Vui lòng nhập đầy đủ thông tin" }, JsonRequestBehavior.AllowGet);

            }
        }
        [HttpPost]
        public JsonResult UsRegister(string email,string username, string password,string confirm)
        {
            var modal = new UserDAO().existEmail(email);

            if (modal != null)
            {
                return Json(new { code = 400, msg = "Email đã tồn tại" }, JsonRequestBehavior.AllowGet);

            }
            else
            {
                if (password.Length < 6)
                {
                    return Json(new { code = 400, msg = "Mật khẩu phải từ 6 ký tự trở lên" }, JsonRequestBehavior.AllowGet);
                }
                if (password != confirm)
                {
                    return Json(new { code = 500, msg = "Mật khẩu và xác nhận không trùng khớp" }, JsonRequestBehavior.AllowGet);

                }
                var user = new UserDAO().addEmployee(email, username, password);
                ProfileUser us = new ProfileUser(user.id);
                var profile=new ProfileUserDAO().addProfile(us);
                return Json(new
                {
                    code = 200,
                    msg = "Đăng ký thành công",
                    user = user,
                    profile= profile,
                }, JsonRequestBehavior.AllowGet);
            }


        }
        [HttpPost]
        public JsonResult CompanyRegister(string name,string email, string website, string type,string address,string password, string confirm)
        
        {
            var modal = new UserDAO().existEmail(email);
            var check1 = new CompanyRegisterDAO().companyExist(website);
            var check2=new CompanyDAO().companyExist(website);
            if (modal != null)
            {
                return Json(new { code = 400, msg = "Email đã tồn tại" }, JsonRequestBehavior.AllowGet);

            }
            else
            {
                if (password.Length < 6)
                {
                    return Json(new { code = 400, msg = "Mật khẩu phải từ 6 ký tự trở lên" }, JsonRequestBehavior.AllowGet);
                }
                if (password != confirm)
                {
                    return Json(new { code = 400, msg = "Mật khẩu và xác nhận không trùng khớp" }, JsonRequestBehavior.AllowGet);

                }
                
                if(check1==null && check2==null)
                {
                    var user = new UserDAO().addCompany(email, name, password);
                    string t = "Oursourcing";
                    if (type == "2")
                    {
                        t = "Product";
                    }
                    var company = new CompanyRegisterDAO().addCompany(name, email, website, t, address);
                    ProfileUser us = new ProfileUser(user.id, "", "", address);
                    var profile = new ProfileUserDAO().addProfile(us);
                    return Json(new
                    {
                        code = 200,
                        msg = "Đăng ký thành công",
                        user = user,
                        company = company,
                        profile = profile,
                    }, JsonRequestBehavior.AllowGet);
                }
                return Json(new { code = 400, msg = "Website đã được đăng ký bởi công ty hoặc đang chờ xét duyệt" }, JsonRequestBehavior.AllowGet);

            }


        }
    }
}