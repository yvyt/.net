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
        public Menu getInner(int inner)
        {
            return db.Menus.Where(x => x.id == inner).FirstOrDefault();
        }
        public Menu getParent(int id)
        {
            return db.Menus.Where(x => x.id == id).FirstOrDefault();
        }
        public Menu getByMeta(string meta)
        {
            return db.Menus.Where(x=>x.meta== meta).FirstOrDefault();   
        }
        public List<Menu> getInnerCreate()
        {
            return db.Menus.Where(x =>  x.inner_menu==null && x.hide==true).OrderBy(x => x.displayOrder).ToList();
        }
    }
}