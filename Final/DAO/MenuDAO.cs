using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;

namespace Final.DAO
{
    public class MenuDAO 
    {
        ItJobDbContext db = null;
        public MenuDAO()
        {
            db= new ItJobDbContext();
        }
        public List<Menu> getAll()
        {
            return db.Menus.Where(x=>x.hide==true).OrderBy(x=>x.displayOrder).ToList();
        }
    }
}