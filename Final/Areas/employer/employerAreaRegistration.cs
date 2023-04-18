using System.Web.Mvc;

namespace Final.Areas.employer
{
    public class employerAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "employer";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "employer_default",
                "employer/{controller}/{action}/{id}",
                new { action = "Index", controller = "Home", id = UrlParameter.Optional }
            );
        }
    }
}