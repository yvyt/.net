using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class BlogDAO
    {
        ItJobDbContext db = null;
        public BlogDAO()
        {
            db = new ItJobDbContext();
        }
        public List<Blog> getAll()
        {
            return db.Blogs.Where(x => x.hide == true).OrderBy(x => x.displayOrder).Take(4).ToList();
        }
        public int sum()
        {
            return db.Blogs.Count();
        }
    }
}