using Final.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Final.Controllers
{
    public class StoryController : Controller
    {
        // GET: Story
        public ActionResult Index()
        {
            var model=new StoryDAO().TaskThreeStory();
            return View(model);
        }
        public ActionResult AnotherStory()
        {
            var model = new StoryDAO().AnotherStory();
            return PartialView(model);
        }
        public ActionResult detail(string meta)
        {
            var model = new StoryDAO().getByMeta(meta);
            return View(model);
        }
        public ActionResult all()
        {
            var modal = new StoryDAO().getAll();
            return View(modal);
        }
    }
}