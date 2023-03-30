using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class CommentDAO
    {
        ItJobDbContext db = null;
        public CommentDAO()
        {
            db = new ItJobDbContext();
        }
        public List<Comment> GetCommentsOfCompany(long Id) {
            return db.Comments.Where(x=>x.CompanyID== Id).ToList();
        }
        public float avgRate(long Id)
        {
            List<Comment> commnets = GetCommentsOfCompany(Id);
            float rate = 0;
            foreach(Comment commnet in commnets)
            {
                rate = (float)(rate + commnet.star);
            }
            return rate/commnets.Count();
        }
    }
}