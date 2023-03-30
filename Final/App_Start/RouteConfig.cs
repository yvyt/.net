using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Final
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute("Job", "{type}/{meta}",
                new { controller = "Job", action = "Index", meta = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    {"type","job" }
                },
                new[] { "Final.Controllers" });
            routes.MapRoute("JobDetail", "{type}/{meta}/{id}",
                new { controller = "Job", action = "getJobDetail", id = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    {"type","job" }
                },
                new[] { "Final.Controllers" });
            routes.MapRoute("Company", "{type}",
                new { controller = "Company", action = "Index", meta = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    {"type","company" }
                },
                new[] { "Final.Controllers" });
            routes.MapRoute("DetailCompany", "{type}/{meta}",
                new { controller = "Company", action = "Details", meta = UrlParameter.Optional },
                new RouteValueDictionary
                {
                    {"type","company" }
                },
                new[] { "Final.Controllers" });
            routes.MapRoute("StoryIT", "{type}",
               new { controller = "Story", action = "Index", meta = UrlParameter.Optional },
               new RouteValueDictionary
               {
                    {"type","story" }
               },
               new[] { "Final.Controllers" });
            routes.MapRoute("Blog", "{type}",
               new { controller = "Blog", action = "Index", meta = UrlParameter.Optional },
               new RouteValueDictionary
               {
                    {"type","blog" }
               },
               new[] { "Final.Controllers" });
            routes.MapRoute("JobApply", "{type}/{id}",
               new { controller = "Job", action = "applyJob", id = UrlParameter.Optional },
               new RouteValueDictionary
               {
                    {"type","ung_tuyen" }
               },
               new[] { "Final.Controllers" });
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}
