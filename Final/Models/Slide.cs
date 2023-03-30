namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Slide")]
    public partial class Slide
    {
        public int id { get; set; }

        [StringLength(250)]
        public string img { get; set; }

        public int displayOrder { get; set; }

        [StringLength(250)]
        public string link { get; set; }

        [Required]
        [StringLength(250)]
        public string description { get; set; }

        public bool? hide { get; set; }

        public DateTime dateBegin { get; set; }

        [Required]
        [StringLength(50)]
        public string createBy { get; set; }

        public DateTime dateModife { get; set; }

        [Required]
        [StringLength(50)]
        public string modifedBy { get; set; }

        [Required]
        [StringLength(500)]
        public string title { get; set; }
    }
}
