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
            return db.Companies.Where(x => x.hide == true).ToList();
        }
        public List<Company> getAll()
        {
            return db.Companies.Where(x=>x.hide==true).ToList();
        }
        public Company getByJobId(long id)
        {
            return db.Companies.Where(x => x.hide == true).FirstOrDefault();

        }
        public Company getByMeta(string meta)
        {
            return db.Companies.Where(x => x.hide == true && x.meta == meta).FirstOrDefault();

        }
        public Company getById(long id)
        {
            return db.Companies.Where(x=>x.id==id).FirstOrDefault();

        }
        public Company getByUser(long id)
        {
            return db.Companies.Where(x=>x.userId==id).FirstOrDefault();
        }
    }
}