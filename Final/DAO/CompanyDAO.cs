using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class CompanyDAO
    {
        ItJobDbContext db = null;
        public CompanyDAO()
        {
            db = new ItJobDbContext();
        }
        public List<Company> getByJob(long id)
        {
            return db.Companies.Where(x => x.hide == true && x.jobID==id).ToList();
        }
        public List<Company> getAll()
        {
            return db.Companies.ToList();
        }
        public Company getByJobId(long id)
        {
            return db.Companies.Where(x => x.hide == true && x.jobID == id).FirstOrDefault();

        }
        public Company getByMeta(string meta)
        {
            return db.Companies.Where(x => x.hide == true && x.meta == meta).FirstOrDefault();

        }

    }
}