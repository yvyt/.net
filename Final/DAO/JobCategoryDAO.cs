using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class JobCategoryDAO
    {
        ItJobDbContext db = null;
        public JobCategoryDAO()
        {
            db = new ItJobDbContext();
        }
        public List<JobCategory> getAll()
        {
            return db.JobCategories.Where(x => x.hide == true).Take(4).ToList();
        }
        public JobCategory getByMeta(string meta) {
            return db.JobCategories.Where(x=>x.meta == meta).FirstOrDefault();
        }
    }
}