namespace Final.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Company")]
    public partial class Company
    {
        public long id { get; set; }

        [StringLength(250)]
        public string name { get; set; }

        [StringLength(250)]
        public string meta { get; set; }

        [Required]
        [StringLength(250)]
        public string type { get; set; }

        [StringLength(250)]
        public string country { get; set; }

        [Required]
        [StringLength(250)]
        public string location { get; set; }

        [Required]
        [StringLength(250)]
        public string website { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string detail { get; set; }

        [StringLength(50)]
        public string contact { get; set; }

        public bool? hide { get; set; }

        public DateTime? dateBegin { get; set; }

        [StringLength(50)]
        public string createBy { get; set; }

        public DateTime? dateModife { get; set; }

        [StringLength(50)]
        public string modifedBy { get; set; }

        public bool? showOnHome { get; set; }

        [StringLength(500)]
        public string Tags { get; set; }

        [Required]
        [StringLength(500)]
        public string image { get; set; }

        public long jobID { get; set; }

        public bool? OT { get; set; }

        public int? employers { get; set; }
    }
}
