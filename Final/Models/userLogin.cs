using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final.Models
{
    public class userLogin
    {



        public long id { get; set; }

        public string username { get; set; }

        public string password { get; set; }

        public string email { get; set; }

        public int? role { get; set; }

        public bool? status { get; set; }
        public userLogin(string username, string password, int? role1)
        {
            this.username = username;
            this.password = password;
            this.role = role1;
        }

        public userLogin(long id, string username, string password, string email, int? role, bool? status)
        {
            this.id = id;
            this.username = username;
            this.password = password;
            this.email = email;
            this.role = role;
            this.status = status;
        }

        public userLogin()
        {
        }
    }
}