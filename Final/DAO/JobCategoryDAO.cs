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
        public List<JobCategory> get()
        {
            return db.JobCategories.Where(x => x.hide == true).ToList();
        }
        public JobCategory getByMeta(string meta) {
            int index = meta.IndexOf('/');
            return db.JobCategories.Where(x=>x.meta == meta).FirstOrDefault();
        }
        public List<JobCategory> getShowOnHome()
        {
            return db.JobCategories.Where(x => x.hide == true && x.showOnHome==true).Take(4).ToList();
        }
        public JobCategory getById(int id)
        {
            return db.JobCategories.Where(x=>x.id == id).FirstOrDefault();
        }
        public int sum()
        {
            return db.JobCategories.Count();
        }
    }
}