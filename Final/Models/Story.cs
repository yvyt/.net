namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Story")]
    public partial class Story
    {
        [Key]
        [Column(Order = 0)]
        public long id { get; set; }

        [StringLength(250)]
        public string meta { get; set; }

        [StringLength(500)]
        public string title { get; set; }

        [Column(TypeName = "ntext")]
        public string content_story { get; set; }

        public int? displayOrder { get; set; }

        public bool? hide { get; set; }

        [Key]
        [Column(Order = 1)]
        public DateTime dateBegin { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        public string createBy { get; set; }

        [Key]
        [Column(Order = 3)]
        public DateTime dateModife { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(50)]
        public string modifedBy { get; set; }
    }
}
