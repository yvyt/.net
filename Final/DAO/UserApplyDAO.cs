using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class UserApplyDAO
    {
        ItJobDbContext db = null;
        public UserApplyDAO()
        {
            db = new ItJobDbContext();
        }
        public UserApply apply(long userId,long jobId,string cv,DateTime today)
        {
            UserApply user= new UserApply(userId,jobId,cv,today);
            db.UserApplies.Add(user);
            db.SaveChanges();
            return user;

        }
        public List<UserApply> job(long id) { 
            Company c= db.Companies.Where(x=>x.userId== id).FirstOrDefault();
            List<Job> jobs=db.Jobs.Where(x=>x.companyID==c.id).ToList();
            List <UserApply> all= db.UserApplies.ToList();
            List<UserApply> applies = new List<UserApply>();
            for(int i=0;i<jobs.Count;i++)
            {
                for (int j = 0; j < all.Count; j++)
                {
                    if (jobs[i].id == all[j].jobId)
                    {
                        applies.Add(all[j]);
                    }
                }
            }
            return applies;
        }
        public List<UserApply> getByUserId(int id)
        {
            return db.UserApplies.Where(x=>x.userId== id).ToList();
        }
    }
}