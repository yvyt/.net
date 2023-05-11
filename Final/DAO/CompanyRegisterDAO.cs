using Final.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.DAO
{
    public class CompanyRegisterDAO
    {
        ItJobDbContext db = null;
        public CompanyRegisterDAO()
        {
            db = new ItJobDbContext();
        }
        public companyRegister addCompany(string name, string email, string website, string type, string address)
        {
            companyRegister c = new companyRegister(name,email,website, type,address,true);
            db.CompanyRegisters.Add(c);
            db.SaveChanges();
            return c;
        }
        public companyRegister companyExist(string website)
        {
            return db.CompanyRegisters.Where(x=>x.website== website).FirstOrDefault();
        }
    }
}