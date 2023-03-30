using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class FooterDAO
    {
        public ItJobDbContext db=null;
        public FooterDAO()
        {
            db = new ItJobDbContext();
        }
        public List<Footer> getALL()
        {
            return db.Footers.Where(x => x.hide == true).ToList();

        }
        
    }
}