namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tag")]
    public partial class Tag
    {
        public int id { get; set; }

        [StringLength(250)]
        public string name { get; set; }

        [StringLength(50)]
        public string link { get; set; }
    }
}
