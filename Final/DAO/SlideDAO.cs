using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class SlideDAO
    {
        ItJobDbContext db = null;
        public SlideDAO()
        {
            db = new ItJobDbContext();
        }
        public List<Slide> getSlide()
        {
            return db.Slides.OrderBy(x=>x.displayOrder).Take(3).ToList();
        }
    }
}