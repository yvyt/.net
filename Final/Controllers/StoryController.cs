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
    }
}