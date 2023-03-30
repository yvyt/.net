using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class BlogCategoryDAO
    {
        ItJobDbContext db = null;
        public BlogCategoryDAO()
        {
            db = new ItJobDbContext();
        }
        public List<BlogCategory> getAll()
        {
            return db.BlogCategories.Where(x => x.hide == true).OrderBy(x=>x.displayOrder).Take(4).ToList();
        }
    }
}