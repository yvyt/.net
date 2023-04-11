namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact")]
    public partial class Contact
    {
        public long id { get; set; }

        [Column(TypeName = "ntext")]
        public string contentD { get; set; }

        public bool? hide { get; set; }
    }
}
