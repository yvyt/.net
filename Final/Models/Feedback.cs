namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Feedback")]
    public partial class Feedback
    {
        public long id { get; set; }

        [Required]
        [StringLength(50)]
        public string name { get; set; }

        [Required]
        [StringLength(50)]
        public string email { get; set; }

        [StringLength(50)]
        public string sdt { get; set; }

        [Required]
        [StringLength(10)]
        public string createDate { get; set; }

        [Column(TypeName = "ntext")]
        public string contentF { get; set; }

        public bool status { get; set; }
    }
}
