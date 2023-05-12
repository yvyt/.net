namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("companyRegister")]
    public partial class companyRegister
    {
        [Required]
        [StringLength(250)]
        public string website { get; set; }

        public long id { get; set; }

        [Required]
        [StringLength(250)]
        public string name { get; set; }

        [Required]
        [StringLength(250)]
        public string type { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string location { get; set; }

        [Required]
        [StringLength(250)]
        public string email { get; set; }

        public bool active { get; set; }

        public companyRegister(string website, string name, string type, string location, string email, bool active)
        {
            this.website = website;
            this.name = name;
            this.type = type;
            this.location = location;
            this.email = email;
            this.active = active;
        }
        public companyRegister() { }
    }
}
