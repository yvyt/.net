using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class JobDAO
    {
        ItJobDbContext db = null;
        public JobDAO()
        {
            db = new ItJobDbContext();
        }
        public List<Job> getAll(long id)
        {
            return db.Jobs.Where(x => x.hide == true && x.categoryID==id).Take(4).ToList();
        }
        public List<Job> getAllJob()
        {
            return db.Jobs.Where(x=>x.hide==true).ToList();
        } 
        public Job getJobDetail(long id) { 
            return db.Jobs.Where(x=>x.id==id).FirstOrDefault();
        }
        public List<Job> getByIdCompany(long id)
        {
            return db.Jobs.Where(x=>x.companyID==id).ToList();
        }
        public Job getById(int id)
        {
            return db.Jobs.Where(x=>x.id== id).FirstOrDefault();
        }
    }
}