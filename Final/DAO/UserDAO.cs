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
        public User login(string email, string password)
        {
            return db.Users.Where(x=>x.email== email && x.password==password && x.status==true).FirstOrDefault();
        }
        public User existEmail (string email)
        {
            return db.Users.Where(x=>x.email==email).FirstOrDefault();
        }
        public User addEmployee(string email, string username,string password)
        {
            User u= new User(email,username,password,1,true);
            db.Users.Add(u);
            db.SaveChanges();
            return u;
        }
        public User addCompany(string email, string username, string password)
        {
            User u = new User(email, username, password, 2, false);
            db.Users.Add(u);
            db.SaveChanges();
            return u;
        }
        public User findUser(string email)
        {
            return db.Users.Where(x=>x.email== email).FirstOrDefault();
        }
    }
}