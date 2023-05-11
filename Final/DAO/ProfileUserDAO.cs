using Final.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class ProfileUserDAO
    {
        ItJobDbContext db = null;
        public ProfileUserDAO()
        {
            db = new ItJobDbContext();
        }
        public ProfileUser getByUserId(int id)
        {
            return db.ProfileUsers.Where(x=>x.userID== id).FirstOrDefault();
        }
        public ProfileUser addProfile(ProfileUser user)
        {
            db.ProfileUsers.Add(user);
            db.SaveChanges();
            return user;
        }
        public ProfileUser updateProfile(int id, string fullname, string phone, string address)
        {
            ProfileUser user= db.ProfileUsers.Where(x=>x.id==id).FirstOrDefault();
            user.fullname = fullname;
            user.phone = phone;
            user.address = address;
            db.SaveChanges();
            return user;

        }
        public ProfileUser getById(int id)
        {
            return db.ProfileUsers.Where(x => x.id == id).FirstOrDefault();
        }
    }
}