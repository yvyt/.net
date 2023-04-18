using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class UserDAO
    {
        ItJobDbContext db = null;
        public UserDAO()
        {
            db = new ItJobDbContext();
        }
        public User getById(int id)
        {
            return db.Users.Where(x=>x.id== id).FirstOrDefault();
        }
        public User login(string username, string password)
        {
            return db.Users.Where(x=>x.username== username && x.password==password && x.status==true).FirstOrDefault();
        }
    }
}