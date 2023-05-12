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
        public long id { get; set; }

        [StringLength(250)]
        public string meta { get; set; }

        [StringLength(500)]
        public string title { get; set; }

        [Column(TypeName = "ntext")]
        public string content_story { get; set; }

        public int? displayOrder { get; set; }

        public bool? hide { get; set; }

        public DateTime dateBegin { get; set; }

        public long createBy { get; set; }

        public DateTime dateModife { get; set; }

        public long modifedBy { get; set; }
    }
}
