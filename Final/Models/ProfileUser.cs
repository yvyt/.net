namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProfileUser")]
    public partial class ProfileUser
    {
        public long id { get; set; }

        public long userID { get; set; }

        [StringLength(550)]
        public string fullname { get; set; }

        [StringLength(10)]
        public string phone { get; set; }

        [StringLength(550)]
        public string address { get; set; }

        public ProfileUser()
        {
        }

        public ProfileUser(long userID)
        {
            this.userID = userID;
        }

        public ProfileUser(long userID, string fullname, string phone, string address) : this(userID)
        {
            this.fullname = fullname;
            this.phone = phone;
            this.address = address;
        }
    }
}
