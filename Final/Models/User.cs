namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public long id { get; set; }

        [StringLength(50)]
        public string username { get; set; }

        [StringLength(50)]
        public string password { get; set; }

        [Required]
        [StringLength(50)]
        public string email { get; set; }

        public int? role { get; set; }

        public bool? status { get; set; }
        public User() { }

        public User(string username, string password, string email, int? role, bool? status)
        {
            this.username = username;
            this.password = password;
            this.email = email;
            this.role = role;
            this.status = status;
        }
    }
}
