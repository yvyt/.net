using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class StoryDAO
    {
        public ItJobDbContext db = null;
        public StoryDAO()
        {
            db = new ItJobDbContext();
        }
        public List<Story> TaskThreeStory()
        {
            return db.Stories.Where(x=>x.hide==true).Take(3).ToList();
        }
        public List<Story> AnotherStory()
        {
            return db.Stories.Where(x => x.hide == true && x.displayOrder>2).Take(6).ToList();
        }
        public int sum()
        {
            return db.Stories.Count();
        }
        public Story getByMeta(string meta)
        {
            return db.Stories.Where(x=>x.meta==meta).FirstOrDefault();
        }
        public List<Story> getAll()
        {
            return db.Stories.Where(x => x.hide == true).OrderBy(x=>x.displayOrder).ToList();
        }
        public List<Story> getByUserId(long id)
        {
            return db.Stories.Where(x=>x.createBy==id).ToList();
        }
    }
}