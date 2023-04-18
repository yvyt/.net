using Final.DAO;
using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Areas.employer.Controllers
{
    public class HomeController : Controller
    {
        // GET: employer/Home
        public ActionResult Index()
        {
            if (Session["user"] == null)
            {
                return View("login");
            }
            return View();
        }
        public ActionResult login()
        {
            return View();
        }
        [HttpPost]
        public JsonResult UsLogin(string username, string password)
        {
            if (username != "" && password != "")
            {
                var modal = new UserDAO().login(username, password);

                if (modal != null)
                {
                    Session["user"] = new userLogin(modal.id, username, password, modal.email, modal.role, modal.status);
                    String link = "";
                    if (modal.role == 0)
                    {
                        link = "/admin/";
                    }
                    else if (modal.role == 1)
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
                        link = link,
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
            return Json(new { username, password });

        }
    }
}
