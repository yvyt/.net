namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("JobCategory")]
    public partial class JobCategory
    {
        public long id { get; set; }

        [StringLength(250)]
        public string name { get; set; }

        [StringLength(250)]
        public string link { get; set; }

        [StringLength(250)]
        public string meta { get; set; }

        public int? displayOrder { get; set; }

        public bool? hide { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime dateBegin { get; set; }

        [Required]
        [StringLength(50)]
        public string createBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime dateModife { get; set; }

        [Required]
        [StringLength(50)]
        public string modifedBy { get; set; }

        public bool? showOnHome { get; set; }
    }
}
